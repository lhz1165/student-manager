package com.daowen.controller;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.JFreeChart;
import org.jfree.chart.servlet.ServletUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.service.BanjiService;
import com.daowen.service.SimpleStatistics;
import com.daowen.ssm.simplecrud.SimpleController;
@Controller
public class TongjiController extends SimpleController {

	@Autowired
	private BanjiService banjiSrv=null;
	@Override
	@RequestMapping("/admin/tongjimanager.do")
	public void mapping(HttpServletRequest req, HttpServletResponse resp) {
		
          mappingMethod(req,resp);
	}
	
	
	
	private void passTongji() {

		String banji = request.getParameter("banji");
		if (banji != null) {
			SimpleStatistics simpleStatistics = new SimpleStatistics();
			JFreeChart chart = simpleStatistics
					.buildPieChart(
							"select COUNT(case when score<60 then 1 else null end) failcount,COUNT(case when score>=60 then 1 else null end) passcount,COUNT(case when score>=80 then 1 else null end) good from xuanke",
							"不及格率", "通过率", "优秀率", "及格率统计");
			String filename = null;
			try {
				filename = ServletUtilities.saveChartAsPNG(chart, 1000, 500,
						request.getSession());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String url = request.getContextPath();
			String imageurl = url + "/servlet/DisplayChart?filename="
					+ filename;
			request.setAttribute("imageurl", imageurl);

		}
		List<Object> banji_datasource = banjiSrv.getEntity("");
		request.setAttribute("banji_datasource", banji_datasource);
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/tongji.jsp";
		}
		forward(forwardurl);

	}

	private void avgTongji() {

		String filter = null;
		String banji = request.getParameter("banji");
		String begintime = request.getParameter("begintime");
		String endtime = request.getParameter("endtime");
		String stno = request.getParameter("stno");
		if (banji != null) {

			filter = MessageFormat
					.format(" select cj.subname,avg(score) from xuanke cj,student s where s.stno=cj.stno  and s.bjid=''{0}'' group by cj.subname ",
							banji);
		}
		if (begintime != null && endtime != null && stno != null) {
			filter = MessageFormat
					.format(" select cj.subname,avg(score) from xuanke cj  where cj.createtime>=''{0}''   and cj.createtime<=''{1}'' and cj.xuehao=''{2}''   group by cj.subname ",
							begintime, endtime, stno);
		}

		if (filter != null) {
			SimpleStatistics simpleStatistics = new SimpleStatistics();
			JFreeChart chart = simpleStatistics.buildColumnChart("科目", "平均分",
					"科目平均分统计", filter);
			String filename = null;
			try {
				filename = ServletUtilities.saveChartAsPNG(chart, 1000, 500,
						request.getSession());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String url = request.getContextPath();
			String imageurl = url + "/servlet/DisplayChart?filename="
					+ filename;
			request.setAttribute("imageurl", imageurl);
		}
		List<Object> banji_datasource =banjiSrv.getEntity("");
		request.setAttribute("banji_datasource", banji_datasource);
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/tongji.jsp";
		}
		forward(forwardurl);

	}
	
	
	
	
	
}
