.class public final Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;
.super Lcom/google/android/exoplayer2/text/cea/CeaDecoder;
.source "Cea708Decoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;,
        Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;
    }
.end annotation


# static fields
.field private static final CC_VALID_FLAG:I = 0x4

.field private static final CHARACTER_BIG_CARONS:I = 0x2a

.field private static final CHARACTER_BIG_OE:I = 0x2c

.field private static final CHARACTER_BOLD_BULLET:I = 0x35

.field private static final CHARACTER_CLOSE_DOUBLE_QUOTE:I = 0x34

.field private static final CHARACTER_CLOSE_SINGLE_QUOTE:I = 0x32

.field private static final CHARACTER_DIAERESIS_Y:I = 0x3f

.field private static final CHARACTER_ELLIPSIS:I = 0x25

.field private static final CHARACTER_FIVE_EIGHTHS:I = 0x78

.field private static final CHARACTER_HORIZONTAL_BORDER:I = 0x7d

.field private static final CHARACTER_LOWER_LEFT_BORDER:I = 0x7c

.field private static final CHARACTER_LOWER_RIGHT_BORDER:I = 0x7e

.field private static final CHARACTER_MN:I = 0x7f

.field private static final CHARACTER_NBTSP:I = 0x21

.field private static final CHARACTER_ONE_EIGHTH:I = 0x76

.field private static final CHARACTER_OPEN_DOUBLE_QUOTE:I = 0x33

.field private static final CHARACTER_OPEN_SINGLE_QUOTE:I = 0x31

.field private static final CHARACTER_SEVEN_EIGHTHS:I = 0x79

.field private static final CHARACTER_SM:I = 0x3d

.field private static final CHARACTER_SMALL_CARONS:I = 0x3a

.field private static final CHARACTER_SMALL_OE:I = 0x3c

.field private static final CHARACTER_SOLID_BLOCK:I = 0x30

.field private static final CHARACTER_THREE_EIGHTHS:I = 0x77

.field private static final CHARACTER_TM:I = 0x39

.field private static final CHARACTER_TSP:I = 0x20

.field private static final CHARACTER_UPPER_LEFT_BORDER:I = 0x7f

.field private static final CHARACTER_UPPER_RIGHT_BORDER:I = 0x7b

.field private static final CHARACTER_VERTICAL_BORDER:I = 0x7a

.field private static final COMMAND_BS:I = 0x8

.field private static final COMMAND_CLW:I = 0x88

.field private static final COMMAND_CR:I = 0xd

.field private static final COMMAND_CW0:I = 0x80

.field private static final COMMAND_CW1:I = 0x81

.field private static final COMMAND_CW2:I = 0x82

.field private static final COMMAND_CW3:I = 0x83

.field private static final COMMAND_CW4:I = 0x84

.field private static final COMMAND_CW5:I = 0x85

.field private static final COMMAND_CW6:I = 0x86

.field private static final COMMAND_CW7:I = 0x87

.field private static final COMMAND_DF0:I = 0x98

.field private static final COMMAND_DF1:I = 0x99

.field private static final COMMAND_DF2:I = 0x9a

.field private static final COMMAND_DF3:I = 0x9b

.field private static final COMMAND_DF5:I = 0x9d

.field private static final COMMAND_DF6:I = 0x9e

.field private static final COMMAND_DF7:I = 0x9f

.field private static final COMMAND_DLC:I = 0x8e

.field private static final COMMAND_DLW:I = 0x8c

.field private static final COMMAND_DLY:I = 0x8d

.field private static final COMMAND_DS4:I = 0x9c

.field private static final COMMAND_DSW:I = 0x89

.field private static final COMMAND_ETX:I = 0x3

.field private static final COMMAND_EXT1:I = 0x10

.field private static final COMMAND_EXT1_END:I = 0x17

.field private static final COMMAND_EXT1_START:I = 0x11

.field private static final COMMAND_FF:I = 0xc

.field private static final COMMAND_HCR:I = 0xe

.field private static final COMMAND_HDW:I = 0x8a

.field private static final COMMAND_NUL:I = 0x0

.field private static final COMMAND_P16_END:I = 0x1f

.field private static final COMMAND_P16_START:I = 0x18

.field private static final COMMAND_RST:I = 0x8f

.field private static final COMMAND_SPA:I = 0x90

.field private static final COMMAND_SPC:I = 0x91

.field private static final COMMAND_SPL:I = 0x92

.field private static final COMMAND_SWA:I = 0x97

.field private static final COMMAND_TGW:I = 0x8b

.field private static final DTVCC_PACKET_DATA:I = 0x2

.field private static final DTVCC_PACKET_START:I = 0x3

.field private static final GROUP_C0_END:I = 0x1f

.field private static final GROUP_C1_END:I = 0x9f

.field private static final GROUP_C2_END:I = 0x1f

.field private static final GROUP_C3_END:I = 0x9f

.field private static final GROUP_G0_END:I = 0x7f

.field private static final GROUP_G1_END:I = 0xff

.field private static final GROUP_G2_END:I = 0x7f

.field private static final GROUP_G3_END:I = 0xff

.field private static final NUM_WINDOWS:I = 0x8

.field private static final TAG:Ljava/lang/String; = "Cea708Decoder"


# instance fields
.field private final ccData:Lcom/google/android/exoplayer2/util/ParsableByteArray;

.field private final cueBuilders:[Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

.field private cues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer2/text/Cue;",
            ">;"
        }
    .end annotation
.end field

.field private currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

.field private currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

.field private currentWindow:I

.field private lastCues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer2/text/Cue;",
            ">;"
        }
    .end annotation
.end field

.field private final selectedServiceNumber:I

.field private final serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;


# direct methods
.method public constructor <init>(I)V
    .locals 4
    .param p1, "accessibilityChannel"    # I

    .prologue
    const/16 v3, 0x8

    .line 163
    invoke-direct {p0}, Lcom/google/android/exoplayer2/text/cea/CeaDecoder;-><init>()V

    .line 164
    new-instance v1, Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-direct {v1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;-><init>()V

    iput-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->ccData:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .line 165
    new-instance v1, Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-direct {v1}, Lcom/google/android/exoplayer2/util/ParsableBitArray;-><init>()V

    iput-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    .line 166
    const/4 v1, -0x1

    if-ne p1, v1, :cond_0

    const/4 p1, 0x1

    .end local p1    # "accessibilityChannel":I
    :cond_0
    iput p1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->selectedServiceNumber:I

    .line 168
    new-array v1, v3, [Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    iput-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cueBuilders:[Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    .line 169
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v3, :cond_1

    .line 170
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cueBuilders:[Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    new-instance v2, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    invoke-direct {v2}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;-><init>()V

    aput-object v2, v1, v0

    .line 169
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 173
    :cond_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cueBuilders:[Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    iput-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    .line 174
    invoke-direct {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->resetCueBuilders()V

    .line 175
    return-void
.end method

.method private finalizeCurrentPacket()V
    .locals 1

    .prologue
    .line 256
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    if-nez v0, :cond_0

    .line 263
    :goto_0
    return-void

    .line 261
    :cond_0
    invoke-direct {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->processCurrentPacket()V

    .line 262
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    goto :goto_0
.end method

.method private getDisplayCues()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer2/text/Cue;",
            ">;"
        }
    .end annotation

    .prologue
    .line 725
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 726
    .local v0, "displayCues":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/text/cea/Cea708Cue;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/16 v2, 0x8

    if-ge v1, v2, :cond_1

    .line 727
    iget-object v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cueBuilders:[Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cueBuilders:[Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->isVisible()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 728
    iget-object v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cueBuilders:[Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->build()Lcom/google/android/exoplayer2/text/cea/Cea708Cue;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 726
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 731
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 732
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    return-object v2
.end method

.method private handleC0Command(I)V
    .locals 3
    .param p1, "command"    # I

    .prologue
    .line 329
    sparse-switch p1, :sswitch_data_0

    .line 349
    const/16 v0, 0x11

    if-lt p1, v0, :cond_0

    const/16 v0, 0x17

    if-gt p1, v0, :cond_0

    .line 350
    const-string/jumbo v0, "Cea708Decoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Currently unsupported COMMAND_EXT1 Command: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 351
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    .line 359
    :goto_0
    :sswitch_0
    return-void

    .line 334
    :sswitch_1
    invoke-direct {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->getDisplayCues()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cues:Ljava/util/List;

    goto :goto_0

    .line 337
    :sswitch_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->backspace()V

    goto :goto_0

    .line 340
    :sswitch_3
    invoke-direct {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->resetCueBuilders()V

    goto :goto_0

    .line 343
    :sswitch_4
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto :goto_0

    .line 352
    :cond_0
    const/16 v0, 0x18

    if-lt p1, v0, :cond_1

    const/16 v0, 0x1f

    if-gt p1, v0, :cond_1

    .line 353
    const-string/jumbo v0, "Cea708Decoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Currently unsupported COMMAND_P16 Command: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 354
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    goto :goto_0

    .line 356
    :cond_1
    const-string/jumbo v0, "Cea708Decoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Invalid C0 command: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 329
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x3 -> :sswitch_1
        0x8 -> :sswitch_2
        0xc -> :sswitch_3
        0xd -> :sswitch_4
        0xe -> :sswitch_0
    .end sparse-switch
.end method

.method private handleC1Command(I)V
    .locals 8
    .param p1, "command"    # I

    .prologue
    const/16 v6, 0x10

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/16 v7, 0x8

    .line 363
    packed-switch p1, :pswitch_data_0

    .line 468
    :pswitch_0
    const-string/jumbo v3, "Cea708Decoder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Invalid C1 command: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 470
    :cond_0
    :goto_0
    :pswitch_1
    return-void

    .line 372
    :pswitch_2
    add-int/lit8 v2, p1, -0x80

    .line 373
    .local v2, "window":I
    iget v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentWindow:I

    if-eq v3, v2, :cond_0

    .line 374
    iput v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentWindow:I

    .line 375
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cueBuilders:[Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    aget-object v3, v3, v2

    iput-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    goto :goto_0

    .line 379
    .end local v2    # "window":I
    :pswitch_3
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_1
    if-gt v1, v7, :cond_0

    .line 380
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBit()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 381
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cueBuilders:[Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    rsub-int/lit8 v4, v1, 0x8

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->clear()V

    .line 379
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 386
    .end local v1    # "i":I
    :pswitch_4
    const/4 v1, 0x1

    .restart local v1    # "i":I
    :goto_2
    if-gt v1, v7, :cond_0

    .line 387
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBit()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 388
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cueBuilders:[Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    rsub-int/lit8 v5, v1, 0x8

    aget-object v3, v3, v5

    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->setVisibility(Z)V

    .line 386
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 393
    .end local v1    # "i":I
    :pswitch_5
    const/4 v1, 0x1

    .restart local v1    # "i":I
    :goto_3
    if-gt v1, v7, :cond_0

    .line 394
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBit()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 395
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cueBuilders:[Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    rsub-int/lit8 v4, v1, 0x8

    aget-object v3, v3, v4

    invoke-virtual {v3, v5}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->setVisibility(Z)V

    .line 393
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 400
    .end local v1    # "i":I
    :pswitch_6
    const/4 v1, 0x1

    .restart local v1    # "i":I
    :goto_4
    if-gt v1, v7, :cond_0

    .line 401
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBit()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 402
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cueBuilders:[Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    rsub-int/lit8 v6, v1, 0x8

    aget-object v0, v3, v6

    .line 403
    .local v0, "cueBuilder":Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->isVisible()Z

    move-result v3

    if-nez v3, :cond_5

    move v3, v4

    :goto_5
    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->setVisibility(Z)V

    .line 400
    .end local v0    # "cueBuilder":Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .restart local v0    # "cueBuilder":Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;
    :cond_5
    move v3, v5

    .line 403
    goto :goto_5

    .line 408
    .end local v0    # "cueBuilder":Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;
    .end local v1    # "i":I
    :pswitch_7
    const/4 v1, 0x1

    .restart local v1    # "i":I
    :goto_6
    if-gt v1, v7, :cond_0

    .line 409
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBit()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 410
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cueBuilders:[Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    rsub-int/lit8 v4, v1, 0x8

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->reset()V

    .line 408
    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 416
    .end local v1    # "i":I
    :pswitch_8
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v3, v7}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    goto/16 :goto_0

    .line 422
    :pswitch_9
    invoke-direct {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->resetCueBuilders()V

    goto/16 :goto_0

    .line 425
    :pswitch_a
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->isDefined()Z

    move-result v3

    if-nez v3, :cond_7

    .line 427
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v3, v6}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    goto/16 :goto_0

    .line 429
    :cond_7
    invoke-direct {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->handleSetPenAttributes()V

    goto/16 :goto_0

    .line 433
    :pswitch_b
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->isDefined()Z

    move-result v3

    if-nez v3, :cond_8

    .line 435
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v4, 0x18

    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    goto/16 :goto_0

    .line 437
    :cond_8
    invoke-direct {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->handleSetPenColor()V

    goto/16 :goto_0

    .line 441
    :pswitch_c
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->isDefined()Z

    move-result v3

    if-nez v3, :cond_9

    .line 443
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v3, v6}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    goto/16 :goto_0

    .line 445
    :cond_9
    invoke-direct {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->handleSetPenLocation()V

    goto/16 :goto_0

    .line 449
    :pswitch_d
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->isDefined()Z

    move-result v3

    if-nez v3, :cond_a

    .line 451
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v4, 0x20

    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    goto/16 :goto_0

    .line 453
    :cond_a
    invoke-direct {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->handleSetWindowAttributes()V

    goto/16 :goto_0

    .line 464
    :pswitch_e
    add-int/lit16 v2, p1, -0x98

    .line 465
    .restart local v2    # "window":I
    invoke-direct {p0, v2}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->handleDefineWindow(I)V

    goto/16 :goto_0

    .line 363
    :pswitch_data_0
    .packed-switch 0x80
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_1
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_d
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_e
    .end packed-switch
.end method

.method private handleC2Command(I)V
    .locals 2
    .param p1, "command"    # I

    .prologue
    const/16 v0, 0xf

    .line 474
    if-gt p1, v0, :cond_1

    .line 483
    :cond_0
    :goto_0
    return-void

    .line 476
    :cond_1
    if-gt p1, v0, :cond_2

    .line 477
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    goto :goto_0

    .line 478
    :cond_2
    const/16 v0, 0x17

    if-gt p1, v0, :cond_3

    .line 479
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    goto :goto_0

    .line 480
    :cond_3
    const/16 v0, 0x1f

    if-gt p1, v0, :cond_0

    .line 481
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v1, 0x18

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    goto :goto_0
.end method

.method private handleC3Command(I)V
    .locals 3
    .param p1, "command"    # I

    .prologue
    .line 487
    const/16 v1, 0x87

    if-gt p1, v1, :cond_1

    .line 488
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    .line 499
    :cond_0
    :goto_0
    return-void

    .line 489
    :cond_1
    const/16 v1, 0x8f

    if-gt p1, v1, :cond_2

    .line 490
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v2, 0x28

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    goto :goto_0

    .line 491
    :cond_2
    const/16 v1, 0x9f

    if-gt p1, v1, :cond_0

    .line 495
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    .line 496
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v2, 0x6

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v0

    .line 497
    .local v0, "length":I
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    mul-int/lit8 v2, v0, 0x8

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    goto :goto_0
.end method

.method private handleDefineWindow(I)V
    .locals 15
    .param p1, "window"    # I

    .prologue
    .line 695
    iget-object v13, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cueBuilders:[Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    aget-object v0, v13, p1

    .line 699
    .local v0, "cueBuilder":Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;
    iget-object v13, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v14, 0x2

    invoke-virtual {v13, v14}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    .line 700
    iget-object v13, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v13}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBit()Z

    move-result v1

    .line 701
    .local v1, "visible":Z
    iget-object v13, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v13}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBit()Z

    move-result v2

    .line 702
    .local v2, "rowLock":Z
    iget-object v13, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v13}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBit()Z

    move-result v3

    .line 703
    .local v3, "columnLock":Z
    iget-object v13, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v14, 0x3

    invoke-virtual {v13, v14}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v4

    .line 705
    .local v4, "priority":I
    iget-object v13, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v13}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBit()Z

    move-result v5

    .line 706
    .local v5, "relativePositioning":Z
    iget-object v13, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v14, 0x7

    invoke-virtual {v13, v14}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v6

    .line 708
    .local v6, "verticalAnchor":I
    iget-object v13, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v14, 0x8

    invoke-virtual {v13, v14}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v7

    .line 710
    .local v7, "horizontalAnchor":I
    iget-object v13, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v14, 0x4

    invoke-virtual {v13, v14}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v10

    .line 711
    .local v10, "anchorId":I
    iget-object v13, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v14, 0x4

    invoke-virtual {v13, v14}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v8

    .line 713
    .local v8, "rowCount":I
    iget-object v13, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v14, 0x2

    invoke-virtual {v13, v14}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    .line 714
    iget-object v13, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v14, 0x6

    invoke-virtual {v13, v14}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v9

    .line 716
    .local v9, "columnCount":I
    iget-object v13, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v14, 0x2

    invoke-virtual {v13, v14}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    .line 717
    iget-object v13, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v14, 0x3

    invoke-virtual {v13, v14}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v11

    .line 718
    .local v11, "windowStyle":I
    iget-object v13, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v14, 0x3

    invoke-virtual {v13, v14}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v12

    .line 720
    .local v12, "penStyle":I
    invoke-virtual/range {v0 .. v12}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->defineWindow(ZZZIZIIIIIII)V

    .line 722
    return-void
.end method

.method private handleG0Character(I)V
    .locals 2
    .param p1, "characterCode"    # I

    .prologue
    .line 502
    const/16 v0, 0x7f

    if-ne p1, v0, :cond_0

    .line 503
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x266b

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    .line 507
    :goto_0
    return-void

    .line 505
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    and-int/lit16 v1, p1, 0xff

    int-to-char v1, v1

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto :goto_0
.end method

.method private handleG1Character(I)V
    .locals 2
    .param p1, "characterCode"    # I

    .prologue
    .line 510
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    and-int/lit16 v1, p1, 0xff

    int-to-char v1, v1

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    .line 511
    return-void
.end method

.method private handleG2Character(I)V
    .locals 3
    .param p1, "characterCode"    # I

    .prologue
    .line 514
    sparse-switch p1, :sswitch_data_0

    .line 594
    const-string/jumbo v0, "Cea708Decoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Invalid G2 character: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 598
    :goto_0
    return-void

    .line 516
    :sswitch_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto :goto_0

    .line 519
    :sswitch_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0xa0

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto :goto_0

    .line 522
    :sswitch_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x2026

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto :goto_0

    .line 525
    :sswitch_3
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x160

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto :goto_0

    .line 528
    :sswitch_4
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x152

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto :goto_0

    .line 531
    :sswitch_5
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x2588

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto :goto_0

    .line 534
    :sswitch_6
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x2018

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto :goto_0

    .line 537
    :sswitch_7
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x2019

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto :goto_0

    .line 540
    :sswitch_8
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x201c

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto :goto_0

    .line 543
    :sswitch_9
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x201d

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto :goto_0

    .line 546
    :sswitch_a
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x2022

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto :goto_0

    .line 549
    :sswitch_b
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x2122

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto :goto_0

    .line 552
    :sswitch_c
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x161

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto :goto_0

    .line 555
    :sswitch_d
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x153

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto :goto_0

    .line 558
    :sswitch_e
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x2120

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto :goto_0

    .line 561
    :sswitch_f
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x178

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto :goto_0

    .line 564
    :sswitch_10
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x215b

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto/16 :goto_0

    .line 567
    :sswitch_11
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x215c

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto/16 :goto_0

    .line 570
    :sswitch_12
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x215d

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto/16 :goto_0

    .line 573
    :sswitch_13
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x215e

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto/16 :goto_0

    .line 576
    :sswitch_14
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x2502

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto/16 :goto_0

    .line 579
    :sswitch_15
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x2510

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto/16 :goto_0

    .line 582
    :sswitch_16
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x2514

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto/16 :goto_0

    .line 585
    :sswitch_17
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x2500

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto/16 :goto_0

    .line 588
    :sswitch_18
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x2518

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto/16 :goto_0

    .line 591
    :sswitch_19
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x250c

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto/16 :goto_0

    .line 514
    :sswitch_data_0
    .sparse-switch
        0x20 -> :sswitch_0
        0x21 -> :sswitch_1
        0x25 -> :sswitch_2
        0x2a -> :sswitch_3
        0x2c -> :sswitch_4
        0x30 -> :sswitch_5
        0x31 -> :sswitch_6
        0x32 -> :sswitch_7
        0x33 -> :sswitch_8
        0x34 -> :sswitch_9
        0x35 -> :sswitch_a
        0x39 -> :sswitch_b
        0x3a -> :sswitch_c
        0x3c -> :sswitch_d
        0x3d -> :sswitch_e
        0x3f -> :sswitch_f
        0x76 -> :sswitch_10
        0x77 -> :sswitch_11
        0x78 -> :sswitch_12
        0x79 -> :sswitch_13
        0x7a -> :sswitch_14
        0x7b -> :sswitch_15
        0x7c -> :sswitch_16
        0x7d -> :sswitch_17
        0x7e -> :sswitch_18
        0x7f -> :sswitch_19
    .end sparse-switch
.end method

.method private handleG3Character(I)V
    .locals 3
    .param p1, "characterCode"    # I

    .prologue
    .line 601
    const/16 v0, 0xa0

    if-ne p1, v0, :cond_0

    .line 602
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x33c4

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    .line 608
    :goto_0
    return-void

    .line 604
    :cond_0
    const-string/jumbo v0, "Cea708Decoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Invalid G3 character: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 606
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    const/16 v1, 0x5f

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->append(C)V

    goto :goto_0
.end method

.method private handleSetPenAttributes()V
    .locals 11

    .prologue
    const/4 v10, 0x3

    const/4 v9, 0x2

    .line 613
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v8, 0x4

    invoke-virtual {v0, v8}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v1

    .line 614
    .local v1, "textTag":I
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v0, v9}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v2

    .line 615
    .local v2, "offset":I
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v0, v9}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v3

    .line 617
    .local v3, "penSize":I
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBit()Z

    move-result v4

    .line 618
    .local v4, "italicsToggle":Z
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBit()Z

    move-result v5

    .line 619
    .local v5, "underlineToggle":Z
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v0, v10}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v6

    .line 620
    .local v6, "edgeType":I
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v0, v10}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v7

    .line 622
    .local v7, "fontStyle":I
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    invoke-virtual/range {v0 .. v7}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->setPenAttributes(IIIZZII)V

    .line 624
    return-void
.end method

.method private handleSetPenColor()V
    .locals 17

    .prologue
    .line 629
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    invoke-virtual/range {v15 .. v16}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v13

    .line 630
    .local v13, "foregroundO":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    invoke-virtual/range {v15 .. v16}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v14

    .line 631
    .local v14, "foregroundR":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    invoke-virtual/range {v15 .. v16}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v12

    .line 632
    .local v12, "foregroundG":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    invoke-virtual/range {v15 .. v16}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v10

    .line 633
    .local v10, "foregroundB":I
    invoke-static {v14, v12, v10, v13}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->getArgbColorFromCeaColor(IIII)I

    move-result v11

    .line 636
    .local v11, "foregroundColor":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    invoke-virtual/range {v15 .. v16}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v4

    .line 637
    .local v4, "backgroundO":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    invoke-virtual/range {v15 .. v16}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v5

    .line 638
    .local v5, "backgroundR":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    invoke-virtual/range {v15 .. v16}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v3

    .line 639
    .local v3, "backgroundG":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    invoke-virtual/range {v15 .. v16}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v1

    .line 640
    .local v1, "backgroundB":I
    invoke-static {v5, v3, v1, v4}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->getArgbColorFromCeaColor(IIII)I

    move-result v2

    .line 643
    .local v2, "backgroundColor":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    invoke-virtual/range {v15 .. v16}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    .line 644
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    invoke-virtual/range {v15 .. v16}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v9

    .line 645
    .local v9, "edgeR":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    invoke-virtual/range {v15 .. v16}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v8

    .line 646
    .local v8, "edgeG":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    invoke-virtual/range {v15 .. v16}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v6

    .line 647
    .local v6, "edgeB":I
    invoke-static {v9, v8, v6}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->getArgbColorFromCeaColor(III)I

    move-result v7

    .line 649
    .local v7, "edgeColor":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    invoke-virtual {v15, v11, v2, v7}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->setPenColor(III)V

    .line 650
    return-void
.end method

.method private handleSetPenLocation()V
    .locals 4

    .prologue
    const/4 v3, 0x4

    .line 655
    iget-object v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    .line 656
    iget-object v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v1

    .line 658
    .local v1, "row":I
    iget-object v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    .line 659
    iget-object v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v3, 0x6

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v0

    .line 661
    .local v0, "column":I
    iget-object v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    invoke-virtual {v2, v1, v0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->setPenLocation(II)V

    .line 662
    return-void
.end method

.method private handleSetWindowAttributes()V
    .locals 17

    .prologue
    .line 667
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v14

    .line 668
    .local v14, "fillO":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v15

    .line 669
    .local v15, "fillR":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v13

    .line 670
    .local v13, "fillG":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v12

    .line 671
    .local v12, "fillB":I
    invoke-static {v15, v13, v12, v14}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->getArgbColorFromCeaColor(IIII)I

    move-result v2

    .line 673
    .local v2, "fillColor":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v5

    .line 674
    .local v5, "borderType":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v11

    .line 675
    .local v11, "borderR":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v10

    .line 676
    .local v10, "borderG":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v9

    .line 677
    .local v9, "borderB":I
    invoke-static {v11, v10, v9}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->getArgbColorFromCeaColor(III)I

    move-result v3

    .line 679
    .local v3, "borderColor":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v1}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBit()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 680
    or-int/lit8 v5, v5, 0x4

    .line 682
    :cond_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v1}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBit()Z

    move-result v4

    .line 683
    .local v4, "wordWrapToggle":Z
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v6

    .line 684
    .local v6, "printDirection":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v7

    .line 685
    .local v7, "scrollDirection":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v8

    .line 688
    .local v8, "justification":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/16 v16, 0x8

    move/from16 v0, v16

    invoke-virtual {v1, v0}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    .line 690
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    invoke-virtual/range {v1 .. v8}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->setWindowAttributes(IIZIIII)V

    .line 692
    return-void
.end method

.method private processCurrentPacket()V
    .locals 11

    .prologue
    const/16 v10, 0xff

    const/16 v9, 0x9f

    const/16 v8, 0x7f

    const/16 v7, 0x1f

    const/16 v6, 0x8

    .line 266
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    iget v3, v3, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;->currentIndex:I

    iget-object v4, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    iget v4, v4, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;->packetSize:I

    mul-int/lit8 v4, v4, 0x2

    add-int/lit8 v4, v4, -0x1

    if-eq v3, v4, :cond_0

    .line 267
    const-string/jumbo v3, "Cea708Decoder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "DtvCcPacket ended prematurely; size is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    iget v5, v5, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;->packetSize:I

    mul-int/lit8 v5, v5, 0x2

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", but current index is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    iget v5, v5, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;->currentIndex:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " (sequence number "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    iget v5, v5, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;->sequenceNumber:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    :cond_0
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    iget-object v4, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    iget-object v4, v4, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;->packetData:[B

    iget-object v5, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    iget v5, v5, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;->currentIndex:I

    invoke-virtual {v3, v4, v5}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->reset([BI)V

    .line 274
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v2

    .line 275
    .local v2, "serviceNumber":I
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v4, 0x5

    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v0

    .line 276
    .local v0, "blockSize":I
    const/4 v3, 0x7

    if-ne v2, v3, :cond_1

    .line 278
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    .line 279
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v4, 0x6

    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v3

    add-int/2addr v2, v3

    .line 283
    :cond_1
    if-nez v0, :cond_3

    .line 284
    if-eqz v2, :cond_2

    .line 285
    const-string/jumbo v3, "Cea708Decoder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "serviceNumber is non-zero ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ") when blockSize is 0"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    :cond_2
    return-void

    .line 290
    :cond_3
    iget v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->selectedServiceNumber:I

    if-ne v2, v3, :cond_2

    .line 294
    :goto_0
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v3}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->bitsLeft()I

    move-result v3

    if-lez v3, :cond_2

    .line 295
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v3, v6}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v1

    .line 296
    .local v1, "command":I
    const/16 v3, 0x10

    if-eq v1, v3, :cond_8

    .line 297
    if-gt v1, v7, :cond_4

    .line 298
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->handleC0Command(I)V

    goto :goto_0

    .line 299
    :cond_4
    if-gt v1, v8, :cond_5

    .line 300
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->handleG0Character(I)V

    goto :goto_0

    .line 301
    :cond_5
    if-gt v1, v9, :cond_6

    .line 302
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->handleC1Command(I)V

    .line 304
    invoke-direct {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->getDisplayCues()Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cues:Ljava/util/List;

    goto :goto_0

    .line 305
    :cond_6
    if-gt v1, v10, :cond_7

    .line 306
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->handleG1Character(I)V

    goto :goto_0

    .line 308
    :cond_7
    const-string/jumbo v3, "Cea708Decoder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Invalid base command: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 312
    :cond_8
    iget-object v3, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->serviceBlockPacket:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    invoke-virtual {v3, v6}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v1

    .line 313
    if-gt v1, v7, :cond_9

    .line 314
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->handleC2Command(I)V

    goto :goto_0

    .line 315
    :cond_9
    if-gt v1, v8, :cond_a

    .line 316
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->handleG2Character(I)V

    goto :goto_0

    .line 317
    :cond_a
    if-gt v1, v9, :cond_b

    .line 318
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->handleC3Command(I)V

    goto :goto_0

    .line 319
    :cond_b
    if-gt v1, v10, :cond_c

    .line 320
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->handleG3Character(I)V

    goto :goto_0

    .line 322
    :cond_c
    const-string/jumbo v3, "Cea708Decoder"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Invalid extended command: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method private resetCueBuilders()V
    .locals 2

    .prologue
    .line 736
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v1, 0x8

    if-ge v0, v1, :cond_0

    .line 737
    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cueBuilders:[Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;->reset()V

    .line 736
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 739
    :cond_0
    return-void
.end method


# virtual methods
.method protected createSubtitle()Lcom/google/android/exoplayer2/text/Subtitle;
    .locals 2

    .prologue
    .line 200
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cues:Ljava/util/List;

    iput-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->lastCues:Ljava/util/List;

    .line 201
    new-instance v0, Lcom/google/android/exoplayer2/text/cea/CeaSubtitle;

    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cues:Ljava/util/List;

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/text/cea/CeaSubtitle;-><init>(Ljava/util/List;)V

    return-object v0
.end method

.method protected decode(Lcom/google/android/exoplayer2/text/SubtitleInputBuffer;)V
    .locals 11
    .param p1, "inputBuffer"    # Lcom/google/android/exoplayer2/text/SubtitleInputBuffer;

    .prologue
    .line 206
    iget-object v7, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->ccData:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v8, p1, Lcom/google/android/exoplayer2/text/SubtitleInputBuffer;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v8

    iget-object v9, p1, Lcom/google/android/exoplayer2/text/SubtitleInputBuffer;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->limit()I

    move-result v9

    invoke-virtual {v7, v8, v9}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->reset([BI)V

    .line 207
    :cond_0
    :goto_0
    iget-object v7, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->ccData:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v7}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->bytesLeft()I

    move-result v7

    const/4 v8, 0x3

    if-lt v7, v8, :cond_8

    .line 208
    iget-object v7, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->ccData:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v7}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v7

    and-int/lit8 v3, v7, 0x7

    .line 210
    .local v3, "ccTypeAndValid":I
    and-int/lit8 v2, v3, 0x3

    .line 211
    .local v2, "ccType":I
    and-int/lit8 v7, v3, 0x4

    const/4 v8, 0x4

    if-ne v7, v8, :cond_2

    const/4 v4, 0x1

    .line 212
    .local v4, "ccValid":Z
    :goto_1
    iget-object v7, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->ccData:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v7}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v7

    int-to-byte v0, v7

    .line 213
    .local v0, "ccData1":B
    iget-object v7, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->ccData:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v7}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v7

    int-to-byte v1, v7

    .line 216
    .local v1, "ccData2":B
    const/4 v7, 0x2

    if-eq v2, v7, :cond_1

    const/4 v7, 0x3

    if-ne v2, v7, :cond_0

    .line 220
    :cond_1
    if-nez v4, :cond_3

    .line 221
    invoke-direct {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->finalizeCurrentPacket()V

    goto :goto_0

    .line 211
    .end local v0    # "ccData1":B
    .end local v1    # "ccData2":B
    .end local v4    # "ccValid":Z
    :cond_2
    const/4 v4, 0x0

    goto :goto_1

    .line 225
    .restart local v0    # "ccData1":B
    .restart local v1    # "ccData2":B
    .restart local v4    # "ccValid":Z
    :cond_3
    const/4 v7, 0x3

    if-ne v2, v7, :cond_5

    .line 226
    invoke-direct {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->finalizeCurrentPacket()V

    .line 228
    and-int/lit16 v7, v0, 0xc0

    shr-int/lit8 v6, v7, 0x6

    .line 229
    .local v6, "sequenceNumber":I
    and-int/lit8 v5, v0, 0x3f

    .line 230
    .local v5, "packetSize":I
    if-nez v5, :cond_4

    .line 231
    const/16 v5, 0x40

    .line 234
    :cond_4
    new-instance v7, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    invoke-direct {v7, v6, v5}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;-><init>(II)V

    iput-object v7, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    .line 235
    iget-object v7, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    iget-object v7, v7, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;->packetData:[B

    iget-object v8, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    iget v9, v8, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;->currentIndex:I

    add-int/lit8 v10, v9, 0x1

    iput v10, v8, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;->currentIndex:I

    aput-byte v1, v7, v9

    .line 249
    .end local v5    # "packetSize":I
    .end local v6    # "sequenceNumber":I
    :goto_2
    iget-object v7, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    iget v7, v7, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;->currentIndex:I

    iget-object v8, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    iget v8, v8, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;->packetSize:I

    mul-int/lit8 v8, v8, 0x2

    add-int/lit8 v8, v8, -0x1

    if-ne v7, v8, :cond_0

    .line 250
    invoke-direct {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->finalizeCurrentPacket()V

    goto :goto_0

    .line 238
    :cond_5
    const/4 v7, 0x2

    if-ne v2, v7, :cond_6

    const/4 v7, 0x1

    :goto_3
    invoke-static {v7}, Lcom/google/android/exoplayer2/util/Assertions;->checkArgument(Z)V

    .line 240
    iget-object v7, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    if-nez v7, :cond_7

    .line 241
    const-string/jumbo v7, "Cea708Decoder"

    const-string/jumbo v8, "Encountered DTVCC_PACKET_DATA before DTVCC_PACKET_START"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 238
    :cond_6
    const/4 v7, 0x0

    goto :goto_3

    .line 245
    :cond_7
    iget-object v7, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    iget-object v7, v7, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;->packetData:[B

    iget-object v8, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    iget v9, v8, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;->currentIndex:I

    add-int/lit8 v10, v9, 0x1

    iput v10, v8, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;->currentIndex:I

    aput-byte v0, v7, v9

    .line 246
    iget-object v7, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    iget-object v7, v7, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;->packetData:[B

    iget-object v8, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    iget v9, v8, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;->currentIndex:I

    add-int/lit8 v10, v9, 0x1

    iput v10, v8, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;->currentIndex:I

    aput-byte v1, v7, v9

    goto :goto_2

    .line 253
    .end local v0    # "ccData1":B
    .end local v1    # "ccData2":B
    .end local v2    # "ccType":I
    .end local v3    # "ccTypeAndValid":I
    .end local v4    # "ccValid":Z
    :cond_8
    return-void
.end method

.method public bridge synthetic dequeueInputBuffer()Lcom/google/android/exoplayer2/text/SubtitleInputBuffer;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/text/SubtitleDecoderException;
        }
    .end annotation

    .prologue
    .line 54
    invoke-super {p0}, Lcom/google/android/exoplayer2/text/cea/CeaDecoder;->dequeueInputBuffer()Lcom/google/android/exoplayer2/text/SubtitleInputBuffer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic dequeueOutputBuffer()Lcom/google/android/exoplayer2/text/SubtitleOutputBuffer;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/text/SubtitleDecoderException;
        }
    .end annotation

    .prologue
    .line 54
    invoke-super {p0}, Lcom/google/android/exoplayer2/text/cea/CeaDecoder;->dequeueOutputBuffer()Lcom/google/android/exoplayer2/text/SubtitleOutputBuffer;

    move-result-object v0

    return-object v0
.end method

.method public flush()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 184
    invoke-super {p0}, Lcom/google/android/exoplayer2/text/cea/CeaDecoder;->flush()V

    .line 185
    iput-object v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cues:Ljava/util/List;

    .line 186
    iput-object v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->lastCues:Ljava/util/List;

    .line 187
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentWindow:I

    .line 188
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cueBuilders:[Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    iget v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentWindow:I

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentCueBuilder:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$CueBuilder;

    .line 189
    invoke-direct {p0}, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->resetCueBuilders()V

    .line 190
    iput-object v2, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->currentDtvCcPacket:Lcom/google/android/exoplayer2/text/cea/Cea708Decoder$DtvCcPacket;

    .line 191
    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 179
    const-string/jumbo v0, "Cea708Decoder"

    return-object v0
.end method

.method protected isNewSubtitleDataAvailable()Z
    .locals 2

    .prologue
    .line 195
    iget-object v0, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->cues:Ljava/util/List;

    iget-object v1, p0, Lcom/google/android/exoplayer2/text/cea/Cea708Decoder;->lastCues:Ljava/util/List;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic queueInputBuffer(Lcom/google/android/exoplayer2/text/SubtitleInputBuffer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/text/SubtitleDecoderException;
        }
    .end annotation

    .prologue
    .line 54
    invoke-super {p0, p1}, Lcom/google/android/exoplayer2/text/cea/CeaDecoder;->queueInputBuffer(Lcom/google/android/exoplayer2/text/SubtitleInputBuffer;)V

    return-void
.end method

.method public bridge synthetic release()V
    .locals 0

    .prologue
    .line 54
    invoke-super {p0}, Lcom/google/android/exoplayer2/text/cea/CeaDecoder;->release()V

    return-void
.end method

.method public bridge synthetic setPositionUs(J)V
    .locals 1

    .prologue
    .line 54
    invoke-super {p0, p1, p2}, Lcom/google/android/exoplayer2/text/cea/CeaDecoder;->setPositionUs(J)V

    return-void
.end method
