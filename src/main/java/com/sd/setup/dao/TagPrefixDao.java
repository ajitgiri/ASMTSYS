/**
 * 
 */
package com.sd.setup.dao;

import java.util.List;

import com.sd.setup.model.TagPrefix;

/**
 * @author SONY
 *
 */
public interface TagPrefixDao {

	List<TagPrefix> getTagPrefixList();

	List<TagPrefix> getTagPrefixList(int sfId);

	void addTagPrefix(TagPrefix tagPrefix);

	TagPrefix getTagPrefixById(int dfid);

	void disableTagPrefix(Integer id);

	void enableTagPrefix(Integer id);

	void deleteTagPrefix(Integer id);

}
