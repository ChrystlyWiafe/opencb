﻿// Octopus MFS is an integrated suite for managing a Micro Finance Institution: 
// clients, contracts, accounting, reporting and risk
// Copyright © 2006,2007 OCTO Technology & OXUS Development Network
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License along
// with this program; if not, write to the Free Software Foundation, Inc.,
// 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//
// Website: http://www.opencbs.com
// Contact: contact@opencbs.com

using System;
using System.Collections.Generic;
using System.Drawing;
using System.Text.RegularExpressions;
using OpenCBS.CoreDomain;
using OpenCBS.Services;
using OpenCBS.MultiLanguageRessources;

namespace OpenCBS.GUI
{
    /// <summary>
    /// Summary description for AddressUserControl.
    /// </summary>
    public partial class AddressUserControl : System.Windows.Forms.UserControl
    {
        private District _district;
        private string _city;
        private int? _cityId;
        private Province _province;
        private string _comments;
        private string _homePhone;
        private string _personalPhone;
        private string _email;
        private string _zipCode;

        public AddressUserControl(bool mandatory = true)
        {
            _Initialization();

            if (mandatory) return;
            labelProvince.Text = ConvertTextToNonMandatory(labelProvince.Text);
            labelDistrict.Text = ConvertTextToNonMandatory(labelDistrict.Text);
            labelCity.Text = ConvertTextToNonMandatory(labelCity.Text);
        }

        public District District
        {
            get { return _district; }
            set
            {
                _district = value;
                _SetValue(_district, _cityId, _city, _comments, _homePhone,_personalPhone,_zipCode,_email);
            }
        }

        public string City
        {
            get { return _city; }
            set
            {
                _city = value;
                _SetValue(_district, _cityId, _city, _comments, _homePhone, _personalPhone, _zipCode, _email);
            }
        }

        public string Comments
        {
            get { return _comments; }
            set
            {
                _comments = value;
                _SetValue(_district, _cityId, _city, _comments, _homePhone, _personalPhone, _zipCode, _email);
            }
        }

        public string HomePhone
        {
            get { return _homePhone; }
            set
            {
                _homePhone= value;
                _SetValue(_district,_cityId, _city, _comments, _homePhone, _personalPhone, _zipCode, _email);
            }
        }

        public string PersonalPhone
        {
            get { return _personalPhone; }
            set
            {
                _personalPhone = value;
                _SetValue(_district, _cityId,_city, _comments, _homePhone, _personalPhone, _zipCode, _email);
            }
        }

        public string Email
        {
            get { return _email; }
            set
            {
                _email = value;
                _SetValue(_district,_cityId, _city, _comments, _homePhone, _personalPhone, _zipCode, _email);
            }
        }

        public string ZipCode
        {
            get { return _zipCode; }
            set
            {
                _zipCode = value;
                _SetValue(_district,_cityId, _city, _comments, _homePhone, _personalPhone, _zipCode, _email);
            }
        }

        public string TextBoxHomePhoneText
        {
            get { return labelHomePhone.Text; }
            set { labelHomePhone.Text = value; }
        }

        public string TextBoxPersonalPhoneText
        {
            get { return labelPersonalPhone.Text; }
            set { labelPersonalPhone.Text = value; }
        }

        private void _SetValue(District pDistrict,int? pCityId, string pCity, 
            string pComments,string pHomePhone,string pPersonalPhone,string pZipCode, string pEmail)
        {
            if (pDistrict != null)
            {
                comboBoxDistrict.Text = pDistrict.Name;
                comboBoxProvince.Text = pDistrict.Province.Name;
            }
            textBoxCity.Text = pCity;
            textBoxCity.Tag = pCityId;
            tbAddress.Text = pComments;
            textBoxHomePhone.Text = pHomePhone;
            textBoxPersonalPhone.Text = pPersonalPhone;
            textBoxEMail.Text = pEmail;
            tbZipCode.Text = pZipCode;
        }

        private void _Initialization()
        {
            InitializeComponent();
            _province = new Province();
            _district = null;
            _city = null;
            _comments = null;
            _homePhone = string.Empty;
            _personalPhone = string.Empty;
            _email = string.Empty;
            _zipCode = string.Empty;
            _InitializeProvince();
            _InitializeDistricts();
            _InitializeCity();
        }

        private void _InitializeProvince()
        {
            comboBoxProvince.Items.Clear();
            var selectProvince = new Province { Name = MultiLanguageStrings.GetString(Ressource.AddressUserControl, "all.Text") };
            comboBoxProvince.Items.Add(selectProvince);

            var provinceList = ServicesProvider.GetInstance().GetLocationServices().GetProvinces();
            foreach (var pro in provinceList)
            {
                comboBoxProvince.Items.Add(pro);
            }
            comboBoxProvince.SelectedItem = selectProvince;
        }

        private void _InitializeCity()
        {
            textBoxCity.MyAutoCompleteSource = ServicesProvider.GetInstance().GetLocationServices().GetCities();
        }

        private void _InitializeDistricts()
        {
            comboBoxDistrict.Items.Clear();

            District selectDistrict = new District{Name = MultiLanguageStrings.GetString(Ressource.AddressUserControl,"selectDistrict.Text")};
            comboBoxDistrict.Items.Add(selectDistrict);

            List<District> districtList = ServicesProvider.GetInstance().GetLocationServices().FindDistrict(_province);
            foreach (District dis in districtList)
            {
                comboBoxDistrict.Items.Add(dis);
            }
            comboBoxDistrict.SelectedItem = selectDistrict;
            _district = null;
        }

        private void _SelectProvince()
        {
            if (_district.Id == 0)
            {
                return;
            }
            foreach (Province selectedProvince in comboBoxProvince.Items)
            {
                if (selectedProvince.Name != _district.Province.Name)
                {
                    continue;
                }
                comboBoxProvince.SelectedItem = selectedProvince;
                _province = selectedProvince;
                break;
            }
        }

        private void _SelectDistrict()
        {
            if (_district == null || _district.Id == 0)
            {
                return;
            }
            foreach (District selectedDistrict in comboBoxDistrict.Items)
            {
                if (selectedDistrict.Name != _district.Name)
                {
                    continue;
                }
                comboBoxDistrict.SelectedItem = selectedDistrict;
                break;
            }
        }

        private void comboBoxDistrict_SelectionChangeCommitted(object sender, System.EventArgs e)
        {
            _district = (District)comboBoxDistrict.SelectedItem;
            _SelectProvince();
            textBoxCity.Text = String.Empty;
        }

        private void textBoxCity_TextChanged(object sender, System.EventArgs e)
        {
            _city = ServicesHelper.CheckTextBoxText(textBoxCity.Text);
            _cityId = (int?)textBoxCity.Tag;
            ChooseDisrictProvinceByCity();
        }

        private void textBoxComments_TextChanged(object sender, System.EventArgs e)
        {
            _comments = ServicesHelper.CheckTextBoxText(tbAddress.Text);
        }

        private void comboBoxProvince_SelectionChangeCommitted(object sender, System.EventArgs e)
        {
            _province = (Province)comboBoxProvince.SelectedItem;
            _InitializeDistricts();
            textBoxCity.Text = String.Empty;
        }

        public void ResetAllComponents()
        {
            _InitializeDistricts();
            _InitializeProvince();
            textBoxCity.Text = string.Empty;
            tbAddress.Text = string.Empty;
            textBoxHomePhone.Text = string.Empty;
            textBoxPersonalPhone.Text = string.Empty;
            tbZipCode.Text = string.Empty;
            textBoxEMail.Text = string.Empty;

        }

        private void buttonSave_Click(object sender, System.EventArgs e)
        {
            CityForm city = new CityForm(_province, _district);
            city.ShowDialog();
            textBoxCity.dropDownEnabled = false;
            textBoxCity.Tag = city.SelectedCityId;
            textBoxCity.Text = city.City;
            
        }

        private void textBoxHomePhone_TextChanged(object sender, EventArgs e)
        {
            _homePhone = ServicesHelper.CheckTextBoxText(textBoxHomePhone.Text);
        }

        private void textBoxPersonalPhone_TextChanged(object sender, EventArgs e)
        {
            _personalPhone = ServicesHelper.CheckTextBoxText(textBoxPersonalPhone.Text);
        }

        private void textBoxHomeType_TextChanged(object sender, EventArgs e)
        {
            _zipCode = ServicesHelper.CheckTextBoxText(tbZipCode.Text);                    
        }

        private void textBoxEMail_TextChanged(object sender, EventArgs e)
        {
            _email = ServicesHelper.CheckTextBoxText(textBoxEMail.Text);
        }

        public bool ExtraVisible
        {
            set
            {
                textBoxHomePhone.Visible = value;
                labelHomePhone.Visible = value;
                textBoxPersonalPhone.Visible = value;
                labelPersonalPhone.Visible = value;
                textBoxEMail.Visible = value;
                labelEMail.Visible = value;
            }
        }

        private void ChooseDisrictProvinceByCity()
        {
            City selectedCity = textBoxCity.GetCity();
            if (selectedCity != null)
            {
                _city = selectedCity.Name;
                _cityId = selectedCity.Id;
                _district = ServicesProvider.GetInstance().GetLocationServices().FindDistirctById(selectedCity.DistrictId);
                _SelectDistrict();
                _SelectProvince();
                char delimeterChar = '(';
                string[] words = _city.Split(delimeterChar);
                textBoxCity.Text = _city = words[0].TrimEnd();
            }
        }
        
        private string ConvertTextToNonMandatory(string text)
        {
            return text.Replace("*", "");
        }
    }
}
