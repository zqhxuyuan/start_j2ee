package com.xuyuan.extjs3.tree.service;

import java.util.List;

import com.xuyuan.extjs3.tree.bean.Exttree;
import com.xuyuan.extjs3.tree.bean.Tree;
import com.xuyuan.extjs3.tree.dao.TreeDao;

public class TreeServiceImpl <T extends Tree> implements TreeService<T>{
	/**
	 * @uml.property  name="dao"
	 * @uml.associationEnd  
	 */
	private TreeDao<T> dao;
	public void setDao(TreeDao<T> dao) {
		this.dao = dao;
	}

	/**
	 * 这是一个递归查询，如果你一下看不明白递归的代码，可以参考getTreeByParentId2Leaf方法
	 * 然后将循环中相同的代码改造成递归即可
	 */
	@SuppressWarnings("unchecked")
	public void getTreeByParentId2Recursion(T entity) throws Exception {
		List<T> child =  dao.getTreeListByParentId(entity);
		//如果某个节点下有子节点,那么把子节点的所有集合设为当前节点的children.否则这个节点就是叶子节点.
		if (child.size() > 0) {
			entity.setChildren((List<Tree>)child);
			for (T s : child) {
				this.getTreeByParentId2Recursion(s);
			}
			//entity.setChildren((List<Tree>)child); //把这段代码放在调用递归函数之前比较好理解. 先执行setChildren在递归调用自身,如此循环
		} else {
			entity.setLeaf(true);
		}
	}

	/**
	 * 帮助你理解递归.  如果树的分层在3层以上呢.下面的代码就要再套上相应的层数的循环. 这也是Tree中只构造3层树的原因.
	 * 当然因为下面这段代码没有真正用到.上面的递归的方法getTreeByParentId2Recursion 是可以分无穷层滴.
	 	if (nodelevel < 3) {
			this.leaf = false;
		} else {
			this.leaf = true;
		}
	 */

	/**
	public void getTreeByParentId2Leaf(T entity) throws Exception {
		List<T> child =  dao.getTreeListByParentId(entity);
		if (child.size() > 0) {
			for (T s : child) {
				List<T> child2 = dao.getTreeListByParentId(s);
				if (child2.size() > 0) {
					for (T s2 : child2) {
						List<T> child3 = dao.getTreeListByParentId(s2);
						if (child3.size() > 0) {
							for (T s3 : child3) {
								List<T> child4 = dao.getTreeListByParentId(s3);
								if (child4.size() == 0) {
									s3.setLeaf(true);
								} else {
									s3.setLeaf(false);
								}
								s2.getChildren().add(s3);
							}
						} else {
							s2.setLeaf(true);
						}
						s.getChildren().add(s2);
					}
				} else {
					s.setLeaf(true);
				}
				entity.getChildren().add(s);
			}
		} else {
			entity.setLeaf(true);
		}
	}
	*/
	//-----------------------------------------------------------------

	public void ajaxModifyTitle(Long id, String title) throws Exception {
        Exttree node = dao.findById(id);
        if (!title.equals(node.getTitle())) { // 当节点标题确认修改了后调用
            node.setTitle(title);
            dao.modify(node);
        }
    }

    public void ajaxRemoveParentById(Long parentId) throws Exception {
        Exttree obj = dao.findById(parentId);
        this.downNode(obj.getParentId().intValue(), obj.getNumber().intValue(), -1);
        dao.ajaxRemoveNode(obj.getId()); // 移除父节点
    }

    public void ajaxMoveNode(Long id, Long oldParentId, Long newParentId, Long nodeIndex) throws Exception {
        Exttree node = dao.findById(id);
        int minIndex = node.getNumber().intValue();
        int maxIndex = nodeIndex.intValue();
        if (oldParentId == newParentId && minIndex != maxIndex) {
            if (minIndex < maxIndex) {
                this.downNode(oldParentId.intValue(), minIndex, maxIndex);
            } else if (minIndex > maxIndex) {
                maxIndex = minIndex;
                minIndex = nodeIndex.intValue();
                this.upNode(oldParentId.intValue(), minIndex, maxIndex);
            }
            node.setNumber(nodeIndex);
            dao.modify(node);
        }
        if (oldParentId != newParentId) {
            this.downNode(oldParentId.intValue(), minIndex, -1);
            this.upNode(newParentId.intValue(), maxIndex, -1);
            node.setNumber(nodeIndex);
            node.setParentId(newParentId);
            dao.modify(node);
        }
    }

    /**
     * update exttree set number=number-1 where parentId = PARENTID and number <= MAX and number > MIN
     *
     */
    public void downNode(int parentId, int minIndex, int maxIndex) throws Exception {
        StringBuffer hql = new StringBuffer("update exttree set number=number-1 where parentId = " + parentId);
        if (maxIndex != -1) {
            hql.append(" and number <= ");
            hql.append(maxIndex);
        }
        if (minIndex != -1) {
            hql.append(" and number > ");
            hql.append(minIndex);
        }
        dao.modifyBySQL(hql.toString());
    }

    public void upNode(int parentId, int minIndex, int maxIndex) throws Exception {
        StringBuffer hql = new StringBuffer("update exttree set number=number+1 where parentId = ");
        hql.append(parentId);
        if (maxIndex != -1) {
            hql.append(" and number < ");
            hql.append(maxIndex);
        }
        if (minIndex != -1) {
            hql.append(" and number >= ");
            hql.append(minIndex);
        }
        dao.modifyBySQL(hql.toString());
    }

    public Exttree findById(Long id) throws Exception {
        return dao.findById(id);
    }

    public List<Exttree> findChildById(Long parentId) throws Exception {
        return dao.findChildById(parentId);
    }

    public void modify(Exttree node) throws Exception {
        dao.modify(node);
    }

    public void save(Exttree node) throws Exception {
        dao.save(node);
    }
}

