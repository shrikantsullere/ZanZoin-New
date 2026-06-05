import * as settingsService from '../services/settings.service.js';
import { sendResponse } from '../utils/response.js';

export const getSettings = async (req, res, next) => {
  try {
    const settings = await settingsService.getSettings();
    sendResponse(res, 200, 'Settings fetched successfully', settings);
  } catch (error) {
    next(error);
  }
};

export const updateSetting = async (req, res, next) => {
  try {
    const updated = await settingsService.updateSetting(req.params.key, req.body.value, req.user.id);
    sendResponse(res, 200, 'Setting updated successfully', updated);
  } catch (error) {
    next(error);
  }
};

export const getSystemSettings = async (req, res, next) => {
  try {
    // Attempt to get from DB, or fallback to default
    const setting = await settingsService.getSettings(); 
    const systemSetting = setting.find(s => s.key === 'system_pricing');
    
    let settingsData = { chauffeur_base_price: '50.00', delivery_base_price: '25.00', pickup_charges: '10.00', per_km_charges: '2.50' };
    if (systemSetting && systemSetting.value) {
      try {
         settingsData = JSON.parse(systemSetting.value);
      } catch(e) {}
    }
    sendResponse(res, 200, 'System settings fetched successfully', settingsData);
  } catch (error) {
    next(error);
  }
};

export const updateSystemSettings = async (req, res, next) => {
  try {
    const updated = await settingsService.updateSetting('system_pricing', JSON.stringify(req.body), req.user.id);
    sendResponse(res, 200, 'System settings updated successfully', req.body);
  } catch (error) {
    next(error);
  }
};
