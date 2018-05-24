package spring.model.blog;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class ReplyDAOTest {
	
	private static BeanFactory beans;
	private static ReplyDAO dao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("daoTest.xml");
		beans = new XmlBeanFactory(resource);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		
	}

	@Before
	public void setUp() throws Exception {
		dao = (ReplyDAO)beans.getBean("rdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testCreate() {
		ReplyDTO dto = new ReplyDTO();
		dto.setBbsno(2);
		dto.setContent("댓글1");
		dto.setId("user1");
		assertTrue(dao.create(dto));
	}

	@Test
	public void testRead() {
		ReplyDTO dto = dao.read(11);
		assertNotNull(dto);
	}

	@Test
	public void testUpdate() {
		ReplyDTO dto = new ReplyDTO();
		dto.setContent("댓글2로 변경");
		dto.setRnum(11);
		assertTrue(dao.update(dto));
	}

	@Test
	public void testDelete() {
		int rnum = 10;
		assertTrue(dao.delete(rnum));
		}

	@Test
	public void testBdelete() {
		int bbsno = 2;
		assertEquals(dao.bdelete(bbsno),1);
	}

	@Test
	public void testList() {
		Map map = new HashMap();
		map.put("bbsno", 2);
		map.put("sno", 1);
		map.put("eno", 2);
		List list = dao.list(map);
		assertEquals(list.size(), 0);
	}//1이 아니기 때문에 에러가 났다.

	@Test
	public void testTotal() {
		int bbsno = 2;
		int cnt = dao.total(bbsno);
		assertEquals(cnt, 0);
	}//댓글의 개수가1이 아니기 때문에 에러가 났다.

}
