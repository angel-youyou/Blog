package com.manager.serviceImp;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.manager.bean.Article;
import com.manager.dao.ArticleMapper;
import com.manager.service.ArticleService;
@Service
@Transactional
public class ArticleServiceImp implements ArticleService {
	
	@Autowired
	private ArticleMapper articleMapper;
	
	@Override
	public List<Article> searchBlogByForIndex( ){
		return articleMapper.searchBlogByForIndex();
	}
}
