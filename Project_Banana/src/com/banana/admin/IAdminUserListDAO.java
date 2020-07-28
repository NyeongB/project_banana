/**
 * 
 */
package com.banana.admin;

import java.util.ArrayList;

import com.banana.util.IndexDTO;

/**
 * @author 김동휘
 *
 */
public interface IAdminUserListDAO
{
	public ArrayList<AdminUserListDTO> list(IndexDTO dto);
	
	public int getCount();
}
