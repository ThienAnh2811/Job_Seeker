package com.backend.service;

import com.backend.entity.Comment;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public interface CommentService {
    Comment saveComment(Comment comment);
    List<Comment> getCommentsByPostId(Long postId);
    Comment getCommentById(Long id);
    void deleteComment(Comment comment);
}
