package com.xuyuan.spring3.recipes.webflow.service;

import java.util.List;

import com.xuyuan.spring3.recipes.webflow.domain.Book;
import com.xuyuan.spring3.recipes.webflow.domain.BookCriteria;

public interface BookService { 

	public List<Book> search(BookCriteria criteria); 
    public Book findByIsbn(String isbn);
    
}
