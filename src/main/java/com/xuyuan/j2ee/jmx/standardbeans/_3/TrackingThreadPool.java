package com.xuyuan.j2ee.jmx.standardbeans._3;

import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * 检测服务器应用程序
 */
public class TrackingThreadPool extends ThreadPoolExecutor {
	/**
	 * @uml.property  name="inProgress"
	 * @uml.associationEnd  qualifier="r:java.lang.Runnable java.lang.Boolean"
	 */
	private final Map<Runnable, Boolean> inProgress = new ConcurrentHashMap<Runnable, Boolean>();
	/**
	 * @uml.property  name="startTime"
	 * @uml.associationEnd  multiplicity="(0 -1)" elementType="java.lang.Long"
	 */
	private final ThreadLocal<Long> startTime = new ThreadLocal<Long>();
	/**
	 * @uml.property  name="totalTime"
	 */
	private long totalTime;
	/**
	 * @uml.property  name="totalTasks"
	 */
	private int totalTasks;

	public TrackingThreadPool(int corePoolSize, int maximumPoolSize,
			long keepAliveTime, TimeUnit unit, BlockingQueue<Runnable> workQueue) {
		super(corePoolSize, maximumPoolSize, keepAliveTime, unit, workQueue);
	}

	protected void beforeExecute(Thread t, Runnable r) {
		super.beforeExecute(t, r);
		inProgress.put(r, Boolean.TRUE);
		startTime.set(new Long(System.currentTimeMillis()));
	}

	protected void afterExecute(Runnable r, Throwable t) {
		long time = System.currentTimeMillis() - startTime.get().longValue();
		synchronized (this) {
			totalTime += time;
			++totalTasks;
		}
		inProgress.remove(r);
		super.afterExecute(r, t);
	}

	public Set<Runnable> getInProgressTasks() {
		return Collections.unmodifiableSet(inProgress.keySet());
	}

	/**
	 * @return
	 * @uml.property  name="totalTasks"
	 */
	public synchronized int getTotalTasks() {
		return totalTasks;
	}

	public synchronized double getAverageTaskTime() {
		return (totalTasks == 0) ? 0 : totalTime / totalTasks;
	}
}
