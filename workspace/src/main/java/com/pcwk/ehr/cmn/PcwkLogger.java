package com.pcwk.ehr.cmn;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * 공통 로거
 * @author JH
 *
 */
public interface PcwkLogger {
	Logger LOG = LogManager.getLogger(PcwkLogger.class);
}
