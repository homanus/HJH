package spring.model.blog;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class MemoDAOTest {
	
	private static BeanFactory beans;
	private static MemoDAO dao;

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
		dao = (MemoDAO)beans.getBean("mdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test @Ignore
	public void testCheckRefnum() {
		boolean flag = dao.checkRefnum(706);
		
		assertTrue(flag);
	}

	@Test @Ignore
	public void testTotal() {
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		int cnt = dao.total(map);
		
		assertEquals(cnt, 18);
	}

	@Test @Ignore
	public void testList() {
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		List list = dao.list(map);
		assertEquals(list.size(), 5);
	}

	@Test @Ignore
	public void testCreate() {
		MemoDTO dto = new MemoDTO();
		dto.setContent("내용test");
		dto.setTitle("제목test");
		assertTrue(dao.create(dto));
	}

	@Test @Ignore
	public void testRead() {
		MemoDTO dto = dao.read(901);
		assertNotNull(dto);
	}

	@Test @Ignore
	public void testUpdate() {
		MemoDTO dto = new MemoDTO();
		dto.setContent("글 변경");
		dto.setTitle("제목변경");
		dto.setMemono(901);
		assertTrue(dao.update(dto));
	}

	@Test @Ignore
	public void testDelete() {
		int memono = 901;
		assertTrue(dao.delete(memono));
	}

	@Test @Ignore
	public void testUpViewcnt() {
		dao.upViewcnt(502);
		MemoDTO dto = dao.read(502);
		
		assertEquals(dto.getViewcnt(),8);
	}

	@Test @Ignore
	public void testReadReply() {
		MemoDTO dto = dao.read(502);
		assertNotNull(dto);
	}

	@Test @Ignore
	public void testUpAnsnum() {
		Map map = new HashMap();
		map.put("grpno", 11);
		map.put("ansnum", 13);
		try {
			dao.upAnsnum(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertEquals(dao.read(11), 14);
		
		
		
	}

	@Test @Ignore
	public void testCreateReply() {
		MemoDTO dto = dao.readReply(3);
		dto.setTitle("답변글 테스트 입니다");
		dto.setContent("내용 글 테스트 입니다.");
		boolean flag = false;
		try {
			flag = dao.createReply(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		assertTrue(flag);
	}

}
