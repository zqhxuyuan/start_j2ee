package com.xuyuan.j2ee.jms.post;

/**
 * 邮件，快递的邮件，非email哦。
 */
public class Mail {
    /**
	 * @uml.property  name="mailId"
	 */
    private String mailId;
    /**
	 * @uml.property  name="country"
	 */
    private String country;
    /**
	 * @uml.property  name="weight"
	 */
    private double weight;

    public Mail() {
    }

    public Mail(String mailId, String country, double weight) {
        this.mailId = mailId;
        this.country = country;
        this.weight = weight;
    }

    /**
	 * @return
	 * @uml.property  name="country"
	 */
    public String getCountry() {
        return country;
    }

    /**
	 * @return
	 * @uml.property  name="mailId"
	 */
    public String getMailId() {
        return mailId;
    }

    /**
	 * @return
	 * @uml.property  name="weight"
	 */
    public double getWeight() {
        return weight;
    }

    /**
	 * @param country
	 * @uml.property  name="country"
	 */
    public void setCountry(String country) {
        this.country = country;
    }

    /**
	 * @param mailId
	 * @uml.property  name="mailId"
	 */
    public void setMailId(String mailId) {
        this.mailId = mailId;
    }

    /**
	 * @param weight
	 * @uml.property  name="weight"
	 */
    public void setWeight(double weight) {
        this.weight = weight;
    }

	@Override
	public String toString() {
		return "Mail [mailId=" + mailId + ", country=" + country + ", weight="
				+ weight + "]";
	}
}
