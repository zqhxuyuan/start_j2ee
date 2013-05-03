package com.xuyuan.search.compass.service;

import java.util.HashSet;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.compass.core.CompassQuery.SortDirection;
import org.compass.core.CompassQuery.SortPropertyType;
import org.compass.core.support.search.CompassSearchCommand;

import org.springframework.util.Assert;

public class AdvancedSearchCommand extends CompassSearchCommand {

	/**
	 * 封装基于Compass 的排序参数.
	 */
	class CompassSort {

		private String name;

		private SortPropertyType type;

		private SortDirection direction;

		public CompassSort() {
		}

		public CompassSort(String sortParamName, String paramType,
				boolean isAscend) {
			Assert.isTrue(StringUtils.isNotBlank(sortParamName));
			setName(sortParamName);

			if ("int".equalsIgnoreCase(paramType)) {
				setType(SortPropertyType.INT);
			} else if ("float".equalsIgnoreCase(paramType)) {
				setType(SortPropertyType.FLOAT);
			} else if ("string".equalsIgnoreCase(paramType)) {
				setType(SortPropertyType.STRING);
			} else {
				setType(SortPropertyType.AUTO);
			}

			if (isAscend) {
				setDirection(SortDirection.AUTO);
			} else {
				setDirection(SortDirection.REVERSE);
			}
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public SortPropertyType getType() {
			return type;
		}

		public void setType(SortPropertyType type) {
			this.type = type;
		}

		public SortDirection getDirection() {
			return direction;
		}

		public void setDirection(SortDirection direction) {
			this.direction = direction;
		}
	}

	/**
	 * 搜索结果排序表.
	 */
	private Set<CompassSort> sortMap = new HashSet<CompassSort>();

	private String[] highlightFields;

	/**
	 * @param paramType
	 *            现定义了三种类型： int string 以及 float。<br>
	 *            除去这三种外，其他会被自动定义为SortPropertyType.AUTO 具体的可见
	 *            {@link org.compass.core.CompassQuery.SortPropertyType}
	 * @param isAscend
	 *            顺序还是倒序排序
	 * @see org.compass.core.CompassQuery.SortPropertyType#AUTO
	 * @see org.compass.core.CompassQuery.SortPropertyType#INT
	 * @see org.compass.core.CompassQuery.SortPropertyType#STRING
	 * @see org.compass.core.CompassQuery.SortPropertyType#FLOAT
	 * @see org.compass.core.CompassQuery.SortDirection#AUTO
	 * @see org.compass.core.CompassQuery.SortDirection#REVERSE
	 */
	public void addSort(String sortParamName, String paramType, boolean isAscend) {
		this.sortMap.add(new CompassSort(sortParamName, paramType, isAscend));
	}

	public Set<CompassSort> getSortMap() {
		return sortMap;
	}

	public void setSortMap(Set<CompassSort> sortMap) {
		this.sortMap = sortMap;
	}

	public String[] getHighlightFields() {
		return highlightFields;
	}

	public void setHighlightFields(String[] highlightFields) {
		this.highlightFields = highlightFields;
	}
}
