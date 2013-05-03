package com.xuyuan.hibernate3.refdoc;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity @DiscriminatorValue("D")
public class DomesticCat extends Cat{

}
