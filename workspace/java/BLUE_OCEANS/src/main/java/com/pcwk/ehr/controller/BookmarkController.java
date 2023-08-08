package com.pcwk.ehr.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pcwk.ehr.cmn.BookmarkVO;
import com.pcwk.ehr.cmn.PcwkLogger;
import com.pcwk.ehr.domain.MainVO;
import com.pcwk.ehr.domain.UserVO;
import com.pcwk.ehr.service.BookmarkService;
import com.pcwk.ehr.service.NaverSearchService;

@Controller("BookmarkController")
@RequestMapping("BLUEOCEAN")
public class BookmarkController implements PcwkLogger {

    @Autowired
    NaverSearchService naverSearchService;

    @Autowired
    BookmarkService bookmarkService;

    // 북마크 화면을 보여주는 메소드
    @RequestMapping(value = "/bookmark.do")
    public String mainView(MainVO inVO) {

        LOG.debug("┌────────────────┐");
        LOG.debug("│bookmarkView    │");
        LOG.debug("│inVO            │" + inVO);
        LOG.debug("└────────────────┘");

        return "main/bookmark";
    }

    // 북마크를 추가하는 메소드
    @RequestMapping(value = "/addBookmark.do")
    @ResponseBody
    public int addBookmark(BookmarkVO vo, Model model) throws SQLException {

        int outVO = bookmarkService.addBookmark(vo);

        LOG.debug("┌────────────────┐");
        LOG.debug("│addBookmark     │");
        LOG.debug("│vo              │" + vo);
        LOG.debug("└────────────────┘");
        model.addAttribute("bookmarkVO", outVO);

        return outVO;
    }

    // 북마크를 삭제하는 메소드
    @RequestMapping(value = "/deleteBookmark.do")
    @ResponseBody
    public int deleteBookmark(BookmarkVO vo) throws SQLException {

        int outVO = bookmarkService.deleteBookmark(vo);

        LOG.debug("┌────────────────┐");
        LOG.debug("│deleteBookmark  │");
        LOG.debug("│vo              │" + vo);
        LOG.debug("└────────────────┘");

        return outVO;
    }

    // 북마크 여부를 확인하는 메소드
    @RequestMapping(value = "/checkBookmark.do")
    @ResponseBody
    public int checkBookmark(BookmarkVO vo) throws SQLException {

        int outVO = bookmarkService.checkBookmark(vo);

        LOG.debug("┌────────────────┐");
        LOG.debug("│checkBookmark   │");
        LOG.debug("│vo              │" + vo);
        LOG.debug("└────────────────┘");

        return outVO;
    }
}
