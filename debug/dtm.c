#include <stdint.h>

typedef enum
{
    IDCODE=0x01,
    DTMCS   =0x10,
    DMI     =0x11,
}JtagDtmTapRegs;

typedef union{
    uint32_t R;
    struct
    {//先写低位
        uint32_t :1;
        uint32_t ManufId:11;
        uint32_t PartNumber:16;
        uint32_t Version:4;
    }B;
}JtagDtmIdcodeUnion;

typedef union
{
    uint32_t R;
    struct
    {
        uint32_t version:4;
        uint32_t abits:6;//地址位数
        uint32_t dmistat:2;
        uint32_t idle:3;
        uint32_t :1;
        uint32_t dmireset:1;
        uint32_t dtmhardreset:1;
        uint32_t errinfo:3;
        uint32_t :11;
    }B;
}JtagDtmcsUnion;


