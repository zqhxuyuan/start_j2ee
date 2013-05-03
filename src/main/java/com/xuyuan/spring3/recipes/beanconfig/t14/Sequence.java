package com.xuyuan.spring3.recipes.beanconfig.t14;

public class Sequence {

    /**
	 * @uml.property  name="id"
	 */
    private String id;
    /**
	 * @uml.property  name="prefix"
	 */
    private String prefix;
    /**
	 * @uml.property  name="suffix"
	 */
    private String suffix;

    public Sequence(String id, String prefix, String suffix) {
        this.id = id;
        this.prefix = prefix;
        this.suffix = suffix;
    }

    /**
	 * @return
	 * @uml.property  name="id"
	 */
    public String getId() {
        return id;
    }

    /**
	 * @return
	 * @uml.property  name="prefix"
	 */
    public String getPrefix() {
        return prefix;
    }

    /**
	 * @return
	 * @uml.property  name="suffix"
	 */
    public String getSuffix() {
        return suffix;
    }

    /**
	 * @param id
	 * @uml.property  name="id"
	 */
    public void setId(String id) {
        this.id = id;
    }

    /**
	 * @param prefix
	 * @uml.property  name="prefix"
	 */
    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    /**
	 * @param suffix
	 * @uml.property  name="suffix"
	 */
    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }
}
