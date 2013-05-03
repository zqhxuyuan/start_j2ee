package com.xuyuan.cache.oscache.jgroups;

import com.opensymphony.oscache.base.FinalizationException;
import com.opensymphony.oscache.base.InitializationException;
import com.opensymphony.oscache.plugins.clustersupport.JavaGroupsBroadcastingListener;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jgroups.Address;
import org.jgroups.Channel;
import org.jgroups.blocks.NotificationBus;
import java.io.Serializable;
import java.util.Properties;

/**
 * @author   yangzheng
 * @version  $Revision$
 * @since   2005-7-14
 */
public class JavaGroupBroadcastingManager implements NotificationBus.Consumer {
    private static final Log    log                   = LogFactory.getLog(JavaGroupsBroadcastingListener.class);
    private static final String BUS_NAME              = "OSCacheBus";
    private static final String CHANNEL_PROPERTIES    = "cache.cluster.properties";
    private static final String MULTICAST_IP_PROPERTY = "cache.cluster.multicast.ip";
    /**
	 * @uml.property  name="bus"
	 * @uml.associationEnd  
	 */
    private NotificationBus     bus;
    
    /**
     * Initializes the broadcasting listener by starting up a JavaGroups notification
     * bus instance to handle incoming and outgoing messages.
     */
    public synchronized void initialize(Properties config) throws InitializationException {
        String properties  = config.getProperty(CHANNEL_PROPERTIES);
        String multicastIP = config.getProperty(MULTICAST_IP_PROPERTY);
        if (log.isInfoEnabled()) {
            log.info("Starting a new JavaGroups broadcasting listener with properties=" + properties);
        }
        try {
            bus = new NotificationBus(BUS_NAME, properties);
            bus.start();
            bus.getChannel().setOpt(Channel.LOCAL, new Boolean(false));
            bus.setConsumer(this);
            log.info("JavaGroups clustering support started successfully");
        } catch (Exception e) {
            throw new InitializationException("Initialization failed: " + e);
        }
    }
    
    /**
     * Shuts down the JavaGroups being managed
     */
    public synchronized void finialize() throws FinalizationException {
        if (log.isInfoEnabled()) {
            log.info("JavaGroups shutting down...");
        }
        bus.stop();
        bus = null;
        if (log.isInfoEnabled()) {
            log.info("JavaGroups shutdown complete.");
        }
    }
    
    /**
     * Uses JavaGroups to broadcast the supplied notification message across the cluster.
     *
     */
    protected void sendNotification(Serializable message) {
        bus.sendNotification(message);
    }
    
    /**
     * Handles incoming notification messages from JavaGroups. This method should
     * never be called directly.
     *
     */
    public void handleNotification(Serializable serializable) {
        log.info("An cluster notification message received message " + serializable.toString()
                 + "). Notification ignored.");
    }
    
    /**
     * We are not using the caching, so we just return something that identifies
     * us. This method should never be called directly.
     */
    public Serializable getCache() {
        return "JavaGroupsBroadcastingListener: " + bus.getLocalAddress();
    }
    
    /**
     * A callback that is fired when a new member joins the cluster. This
     * method should never be called directly.
     *
     * @param address The address of the member who just joined.
     */
    public void memberJoined(Address address) {
        if (log.isInfoEnabled()) {
            log.info("A new member at address '" + address + "' has joined the cluster");
        }
    }
    
    /**
     * A callback that is fired when an existing member leaves the cluster.
     * This method should never be called directly.
     *
     * @param address The address of the member who left.
     */
    public void memberLeft(Address address) {
        if (log.isInfoEnabled()) {
            log.info("Member at address '" + address + "' left the cluster");
        }
    }
}

