webtalk_init -webtalk_dir /mnt/MyStorage/Projects/PetaLinux/PetaLinux.sdk/webtalk
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "2021-10-04 20:24:57" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "SDK v2018.3" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2018.3" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "amd64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "211735175_0_0_167" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "SDK" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "false" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "hps8ue5h44n2de2ns56b220dm0" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "2018.3_3" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "3" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Ubuntu" -context "user_environment"
webtalk_add_data -client project -key os_release -value "Ubuntu 18.04.6 LTS" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Core(TM) i5-8600 CPU @ 3.10GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "3298.244 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "8.258 GB" -context "user_environment"
webtalk_register_client -client sdk
webtalk_add_data -client sdk -key uid -value "1633371519000" -context "sdk\\\\bsp/1633371519000"
webtalk_add_data -client sdk -key hwid -value "1630614654000" -context "sdk\\\\bsp/1633371519000"
webtalk_add_data -client sdk -key os -value "standalone" -context "sdk\\\\bsp/1633371519000"
webtalk_add_data -client sdk -key apptemplate -value "hello_world" -context "sdk\\\\bsp/1633371519000"
webtalk_add_data -client sdk -key RecordType -value "BSPCreation" -context "sdk\\\\bsp/1633371519000"
webtalk_add_data -client sdk -key uid -value "1633371520000" -context "sdk\\\\application/1633371520000"
webtalk_add_data -client sdk -key hwid -value "1630614654000" -context "sdk\\\\application/1633371520000"
webtalk_add_data -client sdk -key bspid -value "1633371519000" -context "sdk\\\\application/1633371520000"
webtalk_add_data -client sdk -key newbsp -value "true" -context "sdk\\\\application/1633371520000"
webtalk_add_data -client sdk -key os -value "standalone" -context "sdk\\\\application/1633371520000"
webtalk_add_data -client sdk -key apptemplate -value "hello_world" -context "sdk\\\\application/1633371520000"
webtalk_add_data -client sdk -key RecordType -value "APPCreation" -context "sdk\\\\application/1633371520000"
webtalk_add_data -client sdk -key LangUsed -value "C" -context "sdk\\\\application/1633371520000"
webtalk_add_data -client sdk -key Procused -value "microblaze" -context "sdk\\\\application/1633371520000"
webtalk_add_data -client sdk -key uid -value "NA" -context "sdk\\\\bsp/1633371897691"
webtalk_add_data -client sdk -key RecordType -value "ToolUsage" -context "sdk\\\\bsp/1633371897691"
webtalk_add_data -client sdk -key BootgenCount -value "0" -context "sdk\\\\bsp/1633371897691"
webtalk_add_data -client sdk -key DebugCount -value "4" -context "sdk\\\\bsp/1633371897691"
webtalk_add_data -client sdk -key PerfCount -value "0" -context "sdk\\\\bsp/1633371897691"
webtalk_add_data -client sdk -key FlashCount -value "0" -context "sdk\\\\bsp/1633371897691"
webtalk_add_data -client sdk -key CrossTriggCount -value "0" -context "sdk\\\\bsp/1633371897691"
webtalk_add_data -client sdk -key QemuDebugCount -value "0" -context "sdk\\\\bsp/1633371897691"
webtalk_transmit -clientid 4273926975 -regid "211735175_0_0_167" -xml /mnt/MyStorage/Projects/PetaLinux/PetaLinux.sdk/webtalk/usage_statistics_ext_sdk.xml -html /mnt/MyStorage/Projects/PetaLinux/PetaLinux.sdk/webtalk/usage_statistics_ext_sdk.html -wdm /mnt/MyStorage/Projects/PetaLinux/PetaLinux.sdk/webtalk/sdk_webtalk.wdm -intro "<H3>SDK Usage Report</H3><BR>"
webtalk_terminate