#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Coursework.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Coursework.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../../library/motor_led/e_init_port.c ../../library/uart/e_init_uart1.s ../../library/uart/e_uart1_rx_char.s ../../library/uart/e_uart1_tx_char.s ../../library/I2C/e_I2C_protocol.c ../../library/I2C/e_I2C_master_module.c ../../library/motor_led/advance_one_timer/e_agenda.c ../../library/motor_led/advance_one_timer/e_motors.c main.c ../../library/camera/fast_2_timer/e_common.c ../../library/camera/fast_2_timer/e_interrupt.s ../../library/camera/fast_2_timer/e_po3030k_registers.c ../../library/camera/fast_2_timer/e_po6030k_registers.c ../../library/camera/fast_2_timer/e_timers.c ../../library/camera/fast_2_timer/e_calc_po3030k.c ../../library/camera/fast_2_timer/e_calc_po6030k.c findRed.c imageCapture.c followGreen.c ../../library/camera/fast_2_timer/e_calc_po8030d.c ../../library/camera/fast_2_timer/e_po8030d_registers.c ../../library/acc_gyro/e_lsm330.c ../../library/motor_led/advance_one_timer/e_led.c followYellow.c curious.c colour_recognition.c aggressive.c ../../library/codec/e_const_sound.s ../../library/codec/e_init_codec_slave.s ../../library/codec/e_init_dci_master.s ../../library/codec/e_isr_dci.s ../../library/codec/e_sound.c ../../library/codec/e_sub_dci_kickoff.s ../../library/a_d/e_accelerometer.c ../../library/a_d/e_ad_conv.c ../../library/a_d/e_micro.c fear.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/250871475/e_init_port.o ${OBJECTDIR}/_ext/1464817730/e_init_uart1.o ${OBJECTDIR}/_ext/1464817730/e_uart1_rx_char.o ${OBJECTDIR}/_ext/1464817730/e_uart1_tx_char.o ${OBJECTDIR}/_ext/1017039718/e_I2C_protocol.o ${OBJECTDIR}/_ext/1017039718/e_I2C_master_module.o ${OBJECTDIR}/_ext/530036627/e_agenda.o ${OBJECTDIR}/_ext/530036627/e_motors.o ${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/1605571125/e_common.o ${OBJECTDIR}/_ext/1605571125/e_interrupt.o ${OBJECTDIR}/_ext/1605571125/e_po3030k_registers.o ${OBJECTDIR}/_ext/1605571125/e_po6030k_registers.o ${OBJECTDIR}/_ext/1605571125/e_timers.o ${OBJECTDIR}/_ext/1605571125/e_calc_po3030k.o ${OBJECTDIR}/_ext/1605571125/e_calc_po6030k.o ${OBJECTDIR}/findRed.o ${OBJECTDIR}/imageCapture.o ${OBJECTDIR}/followGreen.o ${OBJECTDIR}/_ext/1605571125/e_calc_po8030d.o ${OBJECTDIR}/_ext/1605571125/e_po8030d_registers.o ${OBJECTDIR}/_ext/623535137/e_lsm330.o ${OBJECTDIR}/_ext/530036627/e_led.o ${OBJECTDIR}/followYellow.o ${OBJECTDIR}/curious.o ${OBJECTDIR}/colour_recognition.o ${OBJECTDIR}/aggressive.o ${OBJECTDIR}/_ext/1851510750/e_const_sound.o ${OBJECTDIR}/_ext/1851510750/e_init_codec_slave.o ${OBJECTDIR}/_ext/1851510750/e_init_dci_master.o ${OBJECTDIR}/_ext/1851510750/e_isr_dci.o ${OBJECTDIR}/_ext/1851510750/e_sound.o ${OBJECTDIR}/_ext/1851510750/e_sub_dci_kickoff.o ${OBJECTDIR}/_ext/1017064210/e_accelerometer.o ${OBJECTDIR}/_ext/1017064210/e_ad_conv.o ${OBJECTDIR}/_ext/1017064210/e_micro.o ${OBJECTDIR}/fear.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/250871475/e_init_port.o.d ${OBJECTDIR}/_ext/1464817730/e_init_uart1.o.d ${OBJECTDIR}/_ext/1464817730/e_uart1_rx_char.o.d ${OBJECTDIR}/_ext/1464817730/e_uart1_tx_char.o.d ${OBJECTDIR}/_ext/1017039718/e_I2C_protocol.o.d ${OBJECTDIR}/_ext/1017039718/e_I2C_master_module.o.d ${OBJECTDIR}/_ext/530036627/e_agenda.o.d ${OBJECTDIR}/_ext/530036627/e_motors.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/_ext/1605571125/e_common.o.d ${OBJECTDIR}/_ext/1605571125/e_interrupt.o.d ${OBJECTDIR}/_ext/1605571125/e_po3030k_registers.o.d ${OBJECTDIR}/_ext/1605571125/e_po6030k_registers.o.d ${OBJECTDIR}/_ext/1605571125/e_timers.o.d ${OBJECTDIR}/_ext/1605571125/e_calc_po3030k.o.d ${OBJECTDIR}/_ext/1605571125/e_calc_po6030k.o.d ${OBJECTDIR}/findRed.o.d ${OBJECTDIR}/imageCapture.o.d ${OBJECTDIR}/followGreen.o.d ${OBJECTDIR}/_ext/1605571125/e_calc_po8030d.o.d ${OBJECTDIR}/_ext/1605571125/e_po8030d_registers.o.d ${OBJECTDIR}/_ext/623535137/e_lsm330.o.d ${OBJECTDIR}/_ext/530036627/e_led.o.d ${OBJECTDIR}/followYellow.o.d ${OBJECTDIR}/curious.o.d ${OBJECTDIR}/colour_recognition.o.d ${OBJECTDIR}/aggressive.o.d ${OBJECTDIR}/_ext/1851510750/e_const_sound.o.d ${OBJECTDIR}/_ext/1851510750/e_init_codec_slave.o.d ${OBJECTDIR}/_ext/1851510750/e_init_dci_master.o.d ${OBJECTDIR}/_ext/1851510750/e_isr_dci.o.d ${OBJECTDIR}/_ext/1851510750/e_sound.o.d ${OBJECTDIR}/_ext/1851510750/e_sub_dci_kickoff.o.d ${OBJECTDIR}/_ext/1017064210/e_accelerometer.o.d ${OBJECTDIR}/_ext/1017064210/e_ad_conv.o.d ${OBJECTDIR}/_ext/1017064210/e_micro.o.d ${OBJECTDIR}/fear.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/250871475/e_init_port.o ${OBJECTDIR}/_ext/1464817730/e_init_uart1.o ${OBJECTDIR}/_ext/1464817730/e_uart1_rx_char.o ${OBJECTDIR}/_ext/1464817730/e_uart1_tx_char.o ${OBJECTDIR}/_ext/1017039718/e_I2C_protocol.o ${OBJECTDIR}/_ext/1017039718/e_I2C_master_module.o ${OBJECTDIR}/_ext/530036627/e_agenda.o ${OBJECTDIR}/_ext/530036627/e_motors.o ${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/1605571125/e_common.o ${OBJECTDIR}/_ext/1605571125/e_interrupt.o ${OBJECTDIR}/_ext/1605571125/e_po3030k_registers.o ${OBJECTDIR}/_ext/1605571125/e_po6030k_registers.o ${OBJECTDIR}/_ext/1605571125/e_timers.o ${OBJECTDIR}/_ext/1605571125/e_calc_po3030k.o ${OBJECTDIR}/_ext/1605571125/e_calc_po6030k.o ${OBJECTDIR}/findRed.o ${OBJECTDIR}/imageCapture.o ${OBJECTDIR}/followGreen.o ${OBJECTDIR}/_ext/1605571125/e_calc_po8030d.o ${OBJECTDIR}/_ext/1605571125/e_po8030d_registers.o ${OBJECTDIR}/_ext/623535137/e_lsm330.o ${OBJECTDIR}/_ext/530036627/e_led.o ${OBJECTDIR}/followYellow.o ${OBJECTDIR}/curious.o ${OBJECTDIR}/colour_recognition.o ${OBJECTDIR}/aggressive.o ${OBJECTDIR}/_ext/1851510750/e_const_sound.o ${OBJECTDIR}/_ext/1851510750/e_init_codec_slave.o ${OBJECTDIR}/_ext/1851510750/e_init_dci_master.o ${OBJECTDIR}/_ext/1851510750/e_isr_dci.o ${OBJECTDIR}/_ext/1851510750/e_sound.o ${OBJECTDIR}/_ext/1851510750/e_sub_dci_kickoff.o ${OBJECTDIR}/_ext/1017064210/e_accelerometer.o ${OBJECTDIR}/_ext/1017064210/e_ad_conv.o ${OBJECTDIR}/_ext/1017064210/e_micro.o ${OBJECTDIR}/fear.o

# Source Files
SOURCEFILES=../../library/motor_led/e_init_port.c ../../library/uart/e_init_uart1.s ../../library/uart/e_uart1_rx_char.s ../../library/uart/e_uart1_tx_char.s ../../library/I2C/e_I2C_protocol.c ../../library/I2C/e_I2C_master_module.c ../../library/motor_led/advance_one_timer/e_agenda.c ../../library/motor_led/advance_one_timer/e_motors.c main.c ../../library/camera/fast_2_timer/e_common.c ../../library/camera/fast_2_timer/e_interrupt.s ../../library/camera/fast_2_timer/e_po3030k_registers.c ../../library/camera/fast_2_timer/e_po6030k_registers.c ../../library/camera/fast_2_timer/e_timers.c ../../library/camera/fast_2_timer/e_calc_po3030k.c ../../library/camera/fast_2_timer/e_calc_po6030k.c findRed.c imageCapture.c followGreen.c ../../library/camera/fast_2_timer/e_calc_po8030d.c ../../library/camera/fast_2_timer/e_po8030d_registers.c ../../library/acc_gyro/e_lsm330.c ../../library/motor_led/advance_one_timer/e_led.c followYellow.c curious.c colour_recognition.c aggressive.c ../../library/codec/e_const_sound.s ../../library/codec/e_init_codec_slave.s ../../library/codec/e_init_dci_master.s ../../library/codec/e_isr_dci.s ../../library/codec/e_sound.c ../../library/codec/e_sub_dci_kickoff.s ../../library/a_d/e_accelerometer.c ../../library/a_d/e_ad_conv.c ../../library/a_d/e_micro.c fear.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Coursework.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=30F6014A
MP_LINKER_FILE_OPTION=,--script="p30f6014A.gld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/250871475/e_init_port.o: ../../library/motor_led/e_init_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/250871475" 
	@${RM} ${OBJECTDIR}/_ext/250871475/e_init_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/250871475/e_init_port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/motor_led/e_init_port.c  -o ${OBJECTDIR}/_ext/250871475/e_init_port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/250871475/e_init_port.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/250871475/e_init_port.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1017039718/e_I2C_protocol.o: ../../library/I2C/e_I2C_protocol.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1017039718" 
	@${RM} ${OBJECTDIR}/_ext/1017039718/e_I2C_protocol.o.d 
	@${RM} ${OBJECTDIR}/_ext/1017039718/e_I2C_protocol.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/I2C/e_I2C_protocol.c  -o ${OBJECTDIR}/_ext/1017039718/e_I2C_protocol.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1017039718/e_I2C_protocol.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1017039718/e_I2C_protocol.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1017039718/e_I2C_master_module.o: ../../library/I2C/e_I2C_master_module.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1017039718" 
	@${RM} ${OBJECTDIR}/_ext/1017039718/e_I2C_master_module.o.d 
	@${RM} ${OBJECTDIR}/_ext/1017039718/e_I2C_master_module.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/I2C/e_I2C_master_module.c  -o ${OBJECTDIR}/_ext/1017039718/e_I2C_master_module.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1017039718/e_I2C_master_module.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1017039718/e_I2C_master_module.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/530036627/e_agenda.o: ../../library/motor_led/advance_one_timer/e_agenda.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/530036627" 
	@${RM} ${OBJECTDIR}/_ext/530036627/e_agenda.o.d 
	@${RM} ${OBJECTDIR}/_ext/530036627/e_agenda.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/motor_led/advance_one_timer/e_agenda.c  -o ${OBJECTDIR}/_ext/530036627/e_agenda.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/530036627/e_agenda.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/530036627/e_agenda.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/530036627/e_motors.o: ../../library/motor_led/advance_one_timer/e_motors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/530036627" 
	@${RM} ${OBJECTDIR}/_ext/530036627/e_motors.o.d 
	@${RM} ${OBJECTDIR}/_ext/530036627/e_motors.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/motor_led/advance_one_timer/e_motors.c  -o ${OBJECTDIR}/_ext/530036627/e_motors.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/530036627/e_motors.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/530036627/e_motors.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1605571125/e_common.o: ../../library/camera/fast_2_timer/e_common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1605571125" 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/camera/fast_2_timer/e_common.c  -o ${OBJECTDIR}/_ext/1605571125/e_common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1605571125/e_common.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1605571125/e_common.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1605571125/e_po3030k_registers.o: ../../library/camera/fast_2_timer/e_po3030k_registers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1605571125" 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_po3030k_registers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_po3030k_registers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/camera/fast_2_timer/e_po3030k_registers.c  -o ${OBJECTDIR}/_ext/1605571125/e_po3030k_registers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1605571125/e_po3030k_registers.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1605571125/e_po3030k_registers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1605571125/e_po6030k_registers.o: ../../library/camera/fast_2_timer/e_po6030k_registers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1605571125" 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_po6030k_registers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_po6030k_registers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/camera/fast_2_timer/e_po6030k_registers.c  -o ${OBJECTDIR}/_ext/1605571125/e_po6030k_registers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1605571125/e_po6030k_registers.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1605571125/e_po6030k_registers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1605571125/e_timers.o: ../../library/camera/fast_2_timer/e_timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1605571125" 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/camera/fast_2_timer/e_timers.c  -o ${OBJECTDIR}/_ext/1605571125/e_timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1605571125/e_timers.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1605571125/e_timers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1605571125/e_calc_po3030k.o: ../../library/camera/fast_2_timer/e_calc_po3030k.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1605571125" 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_calc_po3030k.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_calc_po3030k.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/camera/fast_2_timer/e_calc_po3030k.c  -o ${OBJECTDIR}/_ext/1605571125/e_calc_po3030k.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1605571125/e_calc_po3030k.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1605571125/e_calc_po3030k.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1605571125/e_calc_po6030k.o: ../../library/camera/fast_2_timer/e_calc_po6030k.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1605571125" 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_calc_po6030k.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_calc_po6030k.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/camera/fast_2_timer/e_calc_po6030k.c  -o ${OBJECTDIR}/_ext/1605571125/e_calc_po6030k.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1605571125/e_calc_po6030k.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1605571125/e_calc_po6030k.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/findRed.o: findRed.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/findRed.o.d 
	@${RM} ${OBJECTDIR}/findRed.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  findRed.c  -o ${OBJECTDIR}/findRed.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/findRed.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/findRed.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/imageCapture.o: imageCapture.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/imageCapture.o.d 
	@${RM} ${OBJECTDIR}/imageCapture.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  imageCapture.c  -o ${OBJECTDIR}/imageCapture.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/imageCapture.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/imageCapture.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/followGreen.o: followGreen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/followGreen.o.d 
	@${RM} ${OBJECTDIR}/followGreen.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  followGreen.c  -o ${OBJECTDIR}/followGreen.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/followGreen.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/followGreen.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1605571125/e_calc_po8030d.o: ../../library/camera/fast_2_timer/e_calc_po8030d.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1605571125" 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_calc_po8030d.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_calc_po8030d.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/camera/fast_2_timer/e_calc_po8030d.c  -o ${OBJECTDIR}/_ext/1605571125/e_calc_po8030d.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1605571125/e_calc_po8030d.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1605571125/e_calc_po8030d.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1605571125/e_po8030d_registers.o: ../../library/camera/fast_2_timer/e_po8030d_registers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1605571125" 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_po8030d_registers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_po8030d_registers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/camera/fast_2_timer/e_po8030d_registers.c  -o ${OBJECTDIR}/_ext/1605571125/e_po8030d_registers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1605571125/e_po8030d_registers.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1605571125/e_po8030d_registers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/623535137/e_lsm330.o: ../../library/acc_gyro/e_lsm330.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/623535137" 
	@${RM} ${OBJECTDIR}/_ext/623535137/e_lsm330.o.d 
	@${RM} ${OBJECTDIR}/_ext/623535137/e_lsm330.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/acc_gyro/e_lsm330.c  -o ${OBJECTDIR}/_ext/623535137/e_lsm330.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/623535137/e_lsm330.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/623535137/e_lsm330.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/530036627/e_led.o: ../../library/motor_led/advance_one_timer/e_led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/530036627" 
	@${RM} ${OBJECTDIR}/_ext/530036627/e_led.o.d 
	@${RM} ${OBJECTDIR}/_ext/530036627/e_led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/motor_led/advance_one_timer/e_led.c  -o ${OBJECTDIR}/_ext/530036627/e_led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/530036627/e_led.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/530036627/e_led.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/followYellow.o: followYellow.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/followYellow.o.d 
	@${RM} ${OBJECTDIR}/followYellow.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  followYellow.c  -o ${OBJECTDIR}/followYellow.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/followYellow.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/followYellow.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/curious.o: curious.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/curious.o.d 
	@${RM} ${OBJECTDIR}/curious.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  curious.c  -o ${OBJECTDIR}/curious.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/curious.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/curious.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/colour_recognition.o: colour_recognition.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/colour_recognition.o.d 
	@${RM} ${OBJECTDIR}/colour_recognition.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  colour_recognition.c  -o ${OBJECTDIR}/colour_recognition.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/colour_recognition.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/colour_recognition.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/aggressive.o: aggressive.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/aggressive.o.d 
	@${RM} ${OBJECTDIR}/aggressive.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  aggressive.c  -o ${OBJECTDIR}/aggressive.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/aggressive.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/aggressive.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1851510750/e_sound.o: ../../library/codec/e_sound.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1851510750" 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_sound.o.d 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_sound.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/codec/e_sound.c  -o ${OBJECTDIR}/_ext/1851510750/e_sound.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1851510750/e_sound.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1851510750/e_sound.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1017064210/e_accelerometer.o: ../../library/a_d/e_accelerometer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1017064210" 
	@${RM} ${OBJECTDIR}/_ext/1017064210/e_accelerometer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1017064210/e_accelerometer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/a_d/e_accelerometer.c  -o ${OBJECTDIR}/_ext/1017064210/e_accelerometer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1017064210/e_accelerometer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1017064210/e_accelerometer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1017064210/e_ad_conv.o: ../../library/a_d/e_ad_conv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1017064210" 
	@${RM} ${OBJECTDIR}/_ext/1017064210/e_ad_conv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1017064210/e_ad_conv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/a_d/e_ad_conv.c  -o ${OBJECTDIR}/_ext/1017064210/e_ad_conv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1017064210/e_ad_conv.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1017064210/e_ad_conv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1017064210/e_micro.o: ../../library/a_d/e_micro.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1017064210" 
	@${RM} ${OBJECTDIR}/_ext/1017064210/e_micro.o.d 
	@${RM} ${OBJECTDIR}/_ext/1017064210/e_micro.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/a_d/e_micro.c  -o ${OBJECTDIR}/_ext/1017064210/e_micro.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1017064210/e_micro.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1017064210/e_micro.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/fear.o: fear.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/fear.o.d 
	@${RM} ${OBJECTDIR}/fear.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  fear.c  -o ${OBJECTDIR}/fear.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/fear.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/fear.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/250871475/e_init_port.o: ../../library/motor_led/e_init_port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/250871475" 
	@${RM} ${OBJECTDIR}/_ext/250871475/e_init_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/250871475/e_init_port.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/motor_led/e_init_port.c  -o ${OBJECTDIR}/_ext/250871475/e_init_port.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/250871475/e_init_port.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/250871475/e_init_port.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1017039718/e_I2C_protocol.o: ../../library/I2C/e_I2C_protocol.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1017039718" 
	@${RM} ${OBJECTDIR}/_ext/1017039718/e_I2C_protocol.o.d 
	@${RM} ${OBJECTDIR}/_ext/1017039718/e_I2C_protocol.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/I2C/e_I2C_protocol.c  -o ${OBJECTDIR}/_ext/1017039718/e_I2C_protocol.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1017039718/e_I2C_protocol.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1017039718/e_I2C_protocol.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1017039718/e_I2C_master_module.o: ../../library/I2C/e_I2C_master_module.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1017039718" 
	@${RM} ${OBJECTDIR}/_ext/1017039718/e_I2C_master_module.o.d 
	@${RM} ${OBJECTDIR}/_ext/1017039718/e_I2C_master_module.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/I2C/e_I2C_master_module.c  -o ${OBJECTDIR}/_ext/1017039718/e_I2C_master_module.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1017039718/e_I2C_master_module.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1017039718/e_I2C_master_module.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/530036627/e_agenda.o: ../../library/motor_led/advance_one_timer/e_agenda.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/530036627" 
	@${RM} ${OBJECTDIR}/_ext/530036627/e_agenda.o.d 
	@${RM} ${OBJECTDIR}/_ext/530036627/e_agenda.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/motor_led/advance_one_timer/e_agenda.c  -o ${OBJECTDIR}/_ext/530036627/e_agenda.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/530036627/e_agenda.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/530036627/e_agenda.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/530036627/e_motors.o: ../../library/motor_led/advance_one_timer/e_motors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/530036627" 
	@${RM} ${OBJECTDIR}/_ext/530036627/e_motors.o.d 
	@${RM} ${OBJECTDIR}/_ext/530036627/e_motors.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/motor_led/advance_one_timer/e_motors.c  -o ${OBJECTDIR}/_ext/530036627/e_motors.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/530036627/e_motors.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/530036627/e_motors.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1605571125/e_common.o: ../../library/camera/fast_2_timer/e_common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1605571125" 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_common.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/camera/fast_2_timer/e_common.c  -o ${OBJECTDIR}/_ext/1605571125/e_common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1605571125/e_common.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1605571125/e_common.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1605571125/e_po3030k_registers.o: ../../library/camera/fast_2_timer/e_po3030k_registers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1605571125" 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_po3030k_registers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_po3030k_registers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/camera/fast_2_timer/e_po3030k_registers.c  -o ${OBJECTDIR}/_ext/1605571125/e_po3030k_registers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1605571125/e_po3030k_registers.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1605571125/e_po3030k_registers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1605571125/e_po6030k_registers.o: ../../library/camera/fast_2_timer/e_po6030k_registers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1605571125" 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_po6030k_registers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_po6030k_registers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/camera/fast_2_timer/e_po6030k_registers.c  -o ${OBJECTDIR}/_ext/1605571125/e_po6030k_registers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1605571125/e_po6030k_registers.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1605571125/e_po6030k_registers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1605571125/e_timers.o: ../../library/camera/fast_2_timer/e_timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1605571125" 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_timers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/camera/fast_2_timer/e_timers.c  -o ${OBJECTDIR}/_ext/1605571125/e_timers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1605571125/e_timers.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1605571125/e_timers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1605571125/e_calc_po3030k.o: ../../library/camera/fast_2_timer/e_calc_po3030k.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1605571125" 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_calc_po3030k.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_calc_po3030k.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/camera/fast_2_timer/e_calc_po3030k.c  -o ${OBJECTDIR}/_ext/1605571125/e_calc_po3030k.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1605571125/e_calc_po3030k.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1605571125/e_calc_po3030k.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1605571125/e_calc_po6030k.o: ../../library/camera/fast_2_timer/e_calc_po6030k.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1605571125" 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_calc_po6030k.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_calc_po6030k.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/camera/fast_2_timer/e_calc_po6030k.c  -o ${OBJECTDIR}/_ext/1605571125/e_calc_po6030k.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1605571125/e_calc_po6030k.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1605571125/e_calc_po6030k.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/findRed.o: findRed.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/findRed.o.d 
	@${RM} ${OBJECTDIR}/findRed.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  findRed.c  -o ${OBJECTDIR}/findRed.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/findRed.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/findRed.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/imageCapture.o: imageCapture.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/imageCapture.o.d 
	@${RM} ${OBJECTDIR}/imageCapture.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  imageCapture.c  -o ${OBJECTDIR}/imageCapture.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/imageCapture.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/imageCapture.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/followGreen.o: followGreen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/followGreen.o.d 
	@${RM} ${OBJECTDIR}/followGreen.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  followGreen.c  -o ${OBJECTDIR}/followGreen.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/followGreen.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/followGreen.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1605571125/e_calc_po8030d.o: ../../library/camera/fast_2_timer/e_calc_po8030d.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1605571125" 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_calc_po8030d.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_calc_po8030d.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/camera/fast_2_timer/e_calc_po8030d.c  -o ${OBJECTDIR}/_ext/1605571125/e_calc_po8030d.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1605571125/e_calc_po8030d.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1605571125/e_calc_po8030d.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1605571125/e_po8030d_registers.o: ../../library/camera/fast_2_timer/e_po8030d_registers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1605571125" 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_po8030d_registers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_po8030d_registers.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/camera/fast_2_timer/e_po8030d_registers.c  -o ${OBJECTDIR}/_ext/1605571125/e_po8030d_registers.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1605571125/e_po8030d_registers.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1605571125/e_po8030d_registers.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/623535137/e_lsm330.o: ../../library/acc_gyro/e_lsm330.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/623535137" 
	@${RM} ${OBJECTDIR}/_ext/623535137/e_lsm330.o.d 
	@${RM} ${OBJECTDIR}/_ext/623535137/e_lsm330.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/acc_gyro/e_lsm330.c  -o ${OBJECTDIR}/_ext/623535137/e_lsm330.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/623535137/e_lsm330.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/623535137/e_lsm330.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/530036627/e_led.o: ../../library/motor_led/advance_one_timer/e_led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/530036627" 
	@${RM} ${OBJECTDIR}/_ext/530036627/e_led.o.d 
	@${RM} ${OBJECTDIR}/_ext/530036627/e_led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/motor_led/advance_one_timer/e_led.c  -o ${OBJECTDIR}/_ext/530036627/e_led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/530036627/e_led.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/530036627/e_led.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/followYellow.o: followYellow.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/followYellow.o.d 
	@${RM} ${OBJECTDIR}/followYellow.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  followYellow.c  -o ${OBJECTDIR}/followYellow.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/followYellow.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/followYellow.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/curious.o: curious.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/curious.o.d 
	@${RM} ${OBJECTDIR}/curious.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  curious.c  -o ${OBJECTDIR}/curious.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/curious.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/curious.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/colour_recognition.o: colour_recognition.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/colour_recognition.o.d 
	@${RM} ${OBJECTDIR}/colour_recognition.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  colour_recognition.c  -o ${OBJECTDIR}/colour_recognition.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/colour_recognition.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/colour_recognition.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/aggressive.o: aggressive.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/aggressive.o.d 
	@${RM} ${OBJECTDIR}/aggressive.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  aggressive.c  -o ${OBJECTDIR}/aggressive.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/aggressive.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/aggressive.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1851510750/e_sound.o: ../../library/codec/e_sound.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1851510750" 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_sound.o.d 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_sound.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/codec/e_sound.c  -o ${OBJECTDIR}/_ext/1851510750/e_sound.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1851510750/e_sound.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1851510750/e_sound.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1017064210/e_accelerometer.o: ../../library/a_d/e_accelerometer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1017064210" 
	@${RM} ${OBJECTDIR}/_ext/1017064210/e_accelerometer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1017064210/e_accelerometer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/a_d/e_accelerometer.c  -o ${OBJECTDIR}/_ext/1017064210/e_accelerometer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1017064210/e_accelerometer.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1017064210/e_accelerometer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1017064210/e_ad_conv.o: ../../library/a_d/e_ad_conv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1017064210" 
	@${RM} ${OBJECTDIR}/_ext/1017064210/e_ad_conv.o.d 
	@${RM} ${OBJECTDIR}/_ext/1017064210/e_ad_conv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/a_d/e_ad_conv.c  -o ${OBJECTDIR}/_ext/1017064210/e_ad_conv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1017064210/e_ad_conv.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1017064210/e_ad_conv.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1017064210/e_micro.o: ../../library/a_d/e_micro.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1017064210" 
	@${RM} ${OBJECTDIR}/_ext/1017064210/e_micro.o.d 
	@${RM} ${OBJECTDIR}/_ext/1017064210/e_micro.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../library/a_d/e_micro.c  -o ${OBJECTDIR}/_ext/1017064210/e_micro.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1017064210/e_micro.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1017064210/e_micro.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/fear.o: fear.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/fear.o.d 
	@${RM} ${OBJECTDIR}/fear.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  fear.c  -o ${OBJECTDIR}/fear.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/fear.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -I"../../library" -I"../../library/I2C" -I"../../library/acc_gyro" -I"../../library/camera/fast_2_timer" -I"../../library/motor_led" -I"../../library/motor_led/advance_one_timer" -I"../../library/uart" -I"." -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/fear.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1464817730/e_init_uart1.o: ../../library/uart/e_init_uart1.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1464817730" 
	@${RM} ${OBJECTDIR}/_ext/1464817730/e_init_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464817730/e_init_uart1.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../library/uart/e_init_uart1.s  -o ${OBJECTDIR}/_ext/1464817730/e_init_uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../library/codec" -I"../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1464817730/e_init_uart1.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1464817730/e_init_uart1.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1464817730/e_uart1_rx_char.o: ../../library/uart/e_uart1_rx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1464817730" 
	@${RM} ${OBJECTDIR}/_ext/1464817730/e_uart1_rx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464817730/e_uart1_rx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../library/uart/e_uart1_rx_char.s  -o ${OBJECTDIR}/_ext/1464817730/e_uart1_rx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../library/codec" -I"../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1464817730/e_uart1_rx_char.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1464817730/e_uart1_rx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1464817730/e_uart1_tx_char.o: ../../library/uart/e_uart1_tx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1464817730" 
	@${RM} ${OBJECTDIR}/_ext/1464817730/e_uart1_tx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464817730/e_uart1_tx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../library/uart/e_uart1_tx_char.s  -o ${OBJECTDIR}/_ext/1464817730/e_uart1_tx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../library/codec" -I"../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1464817730/e_uart1_tx_char.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1464817730/e_uart1_tx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1605571125/e_interrupt.o: ../../library/camera/fast_2_timer/e_interrupt.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1605571125" 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_interrupt.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../library/camera/fast_2_timer/e_interrupt.s  -o ${OBJECTDIR}/_ext/1605571125/e_interrupt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../library/codec" -I"../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1605571125/e_interrupt.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1605571125/e_interrupt.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1851510750/e_const_sound.o: ../../library/codec/e_const_sound.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1851510750" 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_const_sound.o.d 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_const_sound.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../library/codec/e_const_sound.s  -o ${OBJECTDIR}/_ext/1851510750/e_const_sound.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../library/codec" -I"../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1851510750/e_const_sound.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1851510750/e_const_sound.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1851510750/e_init_codec_slave.o: ../../library/codec/e_init_codec_slave.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1851510750" 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_init_codec_slave.o.d 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_init_codec_slave.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../library/codec/e_init_codec_slave.s  -o ${OBJECTDIR}/_ext/1851510750/e_init_codec_slave.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../library/codec" -I"../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1851510750/e_init_codec_slave.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1851510750/e_init_codec_slave.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1851510750/e_init_dci_master.o: ../../library/codec/e_init_dci_master.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1851510750" 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_init_dci_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_init_dci_master.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../library/codec/e_init_dci_master.s  -o ${OBJECTDIR}/_ext/1851510750/e_init_dci_master.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../library/codec" -I"../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1851510750/e_init_dci_master.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1851510750/e_init_dci_master.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1851510750/e_isr_dci.o: ../../library/codec/e_isr_dci.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1851510750" 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_isr_dci.o.d 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_isr_dci.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../library/codec/e_isr_dci.s  -o ${OBJECTDIR}/_ext/1851510750/e_isr_dci.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../library/codec" -I"../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1851510750/e_isr_dci.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1851510750/e_isr_dci.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1851510750/e_sub_dci_kickoff.o: ../../library/codec/e_sub_dci_kickoff.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1851510750" 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_sub_dci_kickoff.o.d 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_sub_dci_kickoff.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../library/codec/e_sub_dci_kickoff.s  -o ${OBJECTDIR}/_ext/1851510750/e_sub_dci_kickoff.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../library/codec" -I"../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1851510750/e_sub_dci_kickoff.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1851510750/e_sub_dci_kickoff.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/1464817730/e_init_uart1.o: ../../library/uart/e_init_uart1.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1464817730" 
	@${RM} ${OBJECTDIR}/_ext/1464817730/e_init_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464817730/e_init_uart1.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../library/uart/e_init_uart1.s  -o ${OBJECTDIR}/_ext/1464817730/e_init_uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../library/codec" -I"../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1464817730/e_init_uart1.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1464817730/e_init_uart1.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1464817730/e_uart1_rx_char.o: ../../library/uart/e_uart1_rx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1464817730" 
	@${RM} ${OBJECTDIR}/_ext/1464817730/e_uart1_rx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464817730/e_uart1_rx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../library/uart/e_uart1_rx_char.s  -o ${OBJECTDIR}/_ext/1464817730/e_uart1_rx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../library/codec" -I"../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1464817730/e_uart1_rx_char.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1464817730/e_uart1_rx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1464817730/e_uart1_tx_char.o: ../../library/uart/e_uart1_tx_char.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1464817730" 
	@${RM} ${OBJECTDIR}/_ext/1464817730/e_uart1_tx_char.o.d 
	@${RM} ${OBJECTDIR}/_ext/1464817730/e_uart1_tx_char.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../library/uart/e_uart1_tx_char.s  -o ${OBJECTDIR}/_ext/1464817730/e_uart1_tx_char.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../library/codec" -I"../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1464817730/e_uart1_tx_char.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1464817730/e_uart1_tx_char.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1605571125/e_interrupt.o: ../../library/camera/fast_2_timer/e_interrupt.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1605571125" 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1605571125/e_interrupt.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../library/camera/fast_2_timer/e_interrupt.s  -o ${OBJECTDIR}/_ext/1605571125/e_interrupt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../library/codec" -I"../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1605571125/e_interrupt.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1605571125/e_interrupt.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1851510750/e_const_sound.o: ../../library/codec/e_const_sound.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1851510750" 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_const_sound.o.d 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_const_sound.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../library/codec/e_const_sound.s  -o ${OBJECTDIR}/_ext/1851510750/e_const_sound.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../library/codec" -I"../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1851510750/e_const_sound.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1851510750/e_const_sound.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1851510750/e_init_codec_slave.o: ../../library/codec/e_init_codec_slave.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1851510750" 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_init_codec_slave.o.d 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_init_codec_slave.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../library/codec/e_init_codec_slave.s  -o ${OBJECTDIR}/_ext/1851510750/e_init_codec_slave.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../library/codec" -I"../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1851510750/e_init_codec_slave.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1851510750/e_init_codec_slave.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1851510750/e_init_dci_master.o: ../../library/codec/e_init_dci_master.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1851510750" 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_init_dci_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_init_dci_master.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../library/codec/e_init_dci_master.s  -o ${OBJECTDIR}/_ext/1851510750/e_init_dci_master.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../library/codec" -I"../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1851510750/e_init_dci_master.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1851510750/e_init_dci_master.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1851510750/e_isr_dci.o: ../../library/codec/e_isr_dci.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1851510750" 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_isr_dci.o.d 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_isr_dci.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../library/codec/e_isr_dci.s  -o ${OBJECTDIR}/_ext/1851510750/e_isr_dci.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../library/codec" -I"../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1851510750/e_isr_dci.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1851510750/e_isr_dci.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1851510750/e_sub_dci_kickoff.o: ../../library/codec/e_sub_dci_kickoff.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1851510750" 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_sub_dci_kickoff.o.d 
	@${RM} ${OBJECTDIR}/_ext/1851510750/e_sub_dci_kickoff.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../library/codec/e_sub_dci_kickoff.s  -o ${OBJECTDIR}/_ext/1851510750/e_sub_dci_kickoff.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  -I"../../library/codec" -I"../../library/uart" -I"." -Wa,-MD,"${OBJECTDIR}/_ext/1851510750/e_sub_dci_kickoff.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax,-g$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/1851510750/e_sub_dci_kickoff.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Coursework.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    p30f6014A.gld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Coursework.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,$(MP_LINKER_FILE_OPTION),--heap=512,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="C:/Program Files/Microchip/MPLAB C30/lib",--library-path=".",--no-force-link,--smart-io,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Coursework.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   p30f6014A.gld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Coursework.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=512,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path="C:/Program Files/Microchip/MPLAB C30/lib",--library-path=".",--no-force-link,--smart-io,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}/xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Coursework.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
