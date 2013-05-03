package com.xuyuan.spring3.jdbc;


public class UserModel {
    /**
	 * @uml.property  name="id"
	 */
    private int id;
    /**
	 * @uml.property  name="myName"
	 */
    private String myName;
    
    /**
	 * @param id
	 * @uml.property  name="id"
	 */
    public void setId(int id) {
        this.id = id;
    }
    /**
	 * @return
	 * @uml.property  name="id"
	 */
    public int getId() {
        return id;
    }
    /**
	 * @param myName
	 * @uml.property  name="myName"
	 */
    public void setMyName(String myName) {
        this.myName = myName;
    }
    /**
	 * @return
	 * @uml.property  name="myName"
	 */
    public String getMyName() {
        return myName;
    }
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + id;
        return result;
    }
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        UserModel other = (UserModel) obj;
        if (id != other.id)
            return false;
        return true;
    }
    
}
