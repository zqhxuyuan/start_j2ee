package com.xuyuan.spring3.recipes.aopaspectj;

public class ComplexFormatter {

    /**
	 * @uml.property  name="pattern"
	 */
    private String pattern;

    /**
	 * @param pattern
	 * @uml.property  name="pattern"
	 */
    public void setPattern(String pattern) {
        this.pattern = pattern;
    }

    public String format(Complex complex) {
        return pattern.replaceAll("a", Integer.toString(complex.getReal()))
                .replaceAll("b", Integer.toString(complex.getImaginary()));
    }
}
