package com.xuyuan.spring3.recipes.aopaspectj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;

@Configurable()
public class Complex {

    /**
	 * @uml.property  name="real"
	 */
    private int real;
    /**
	 * @uml.property  name="imaginary"
	 */
    private int imaginary;
    /**
	 * @uml.property  name="formatter"
	 * @uml.associationEnd  
	 */
    private ComplexFormatter formatter;

    public Complex(int real, int imaginary) {
        this.real = real;
        this.imaginary = imaginary;
    }

    /**
	 * @return
	 * @uml.property  name="imaginary"
	 */
    public int getImaginary() {
        return imaginary;
    }

    /**
	 * @return
	 * @uml.property  name="real"
	 */
    public int getReal() {
        return real;
    }

    /**
	 * @param imaginary
	 * @uml.property  name="imaginary"
	 */
    public void setImaginary(int imaginary) {
        this.imaginary = imaginary;
    }

    /**
	 * @param real
	 * @uml.property  name="real"
	 */
    public void setReal(int real) {
        this.real = real;
    }

    /**
	 * @param formatter
	 * @uml.property  name="formatter"
	 */
    @Autowired
    public void setFormatter(ComplexFormatter formatter) {
        this.formatter = formatter;
    }

    public String toString() {
        return formatter.format(this);
    }
}
