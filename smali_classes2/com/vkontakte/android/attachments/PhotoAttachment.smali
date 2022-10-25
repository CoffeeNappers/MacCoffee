.class public Lcom/vkontakte/android/attachments/PhotoAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "PhotoAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/attachments/ThumbAttachment;
.implements Lcom/vkontakte/android/attachments/ImageAttachment;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/attachments/PhotoAttachment$Image;,
        Lcom/vkontakte/android/attachments/PhotoAttachment$FixedSizeImageViewTopCrop;,
        Lcom/vkontakte/android/attachments/PhotoAttachment$FixedSizeImageView;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/PhotoAttachment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public accessKey:Ljava/lang/String;

.field public aid:I

.field public breakAfter:Z

.field public date:I

.field public descr:Ljava/lang/String;

.field public displayH:I

.field public displayW:I

.field public floating:Z

.field public hasSize:Z

.field public images:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/vkontakte/android/attachments/PhotoAttachment$Image;",
            ">;"
        }
    .end annotation
.end field

.field public lat:D

.field public lon:D

.field public oid:I

.field public pid:I

.field public postID:I

.field public ratio:F

.field public srcBig:Ljava/lang/String;

.field public srcThumb:Ljava/lang/String;

.field public thumbType:Ljava/lang/String;

.field public uid:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 128
    new-instance v0, Lcom/vkontakte/android/attachments/PhotoAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/PhotoAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/PhotoAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/Photo;)V
    .locals 6
    .param p1, "photo"    # Lcom/vkontakte/android/Photo;

    .prologue
    const-wide v4, -0x3f3e6c0000000000L    # -9000.0

    .line 93
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 30
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    .line 32
    const-string/jumbo v2, "m"

    iput-object v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->thumbType:Ljava/lang/String;

    .line 36
    iput-wide v4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->lat:D

    .line 37
    iput-wide v4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->lon:D

    .line 94
    iget v2, p1, Lcom/vkontakte/android/Photo;->id:I

    iput v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->pid:I

    .line 95
    iget v2, p1, Lcom/vkontakte/android/Photo;->ownerID:I

    iput v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->oid:I

    .line 96
    iget v2, p1, Lcom/vkontakte/android/Photo;->albumID:I

    iput v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->aid:I

    .line 97
    iget v2, p1, Lcom/vkontakte/android/Photo;->userID:I

    iput v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->uid:I

    .line 98
    iget v2, p1, Lcom/vkontakte/android/Photo;->date:I

    iput v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->date:I

    .line 99
    iget-object v2, p1, Lcom/vkontakte/android/Photo;->descr:Ljava/lang/String;

    iput-object v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->descr:Ljava/lang/String;

    .line 100
    iget-object v2, p1, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/Photo$Image;

    .line 101
    .local v1, "im":Lcom/vkontakte/android/Photo$Image;
    new-instance v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;-><init>()V

    .line 102
    .local v0, "i":Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    iget v3, v1, Lcom/vkontakte/android/Photo$Image;->height:I

    iput v3, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    .line 103
    iget v3, v1, Lcom/vkontakte/android/Photo$Image;->width:I

    iput v3, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    .line 104
    iget-object v3, v1, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    iput-object v3, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->url:Ljava/lang/String;

    .line 105
    iget-char v3, v1, Lcom/vkontakte/android/Photo$Image;->type:C

    iput-char v3, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->type:C

    .line 106
    iget-object v3, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-char v5, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->type:C

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 108
    .end local v0    # "i":Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    .end local v1    # "im":Lcom/vkontakte/android/Photo$Image;
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    const-string/jumbo v3, "x"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    .line 109
    .local v1, "im":Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    if-eqz v1, :cond_1

    iget v2, v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    if-lez v2, :cond_1

    iget v2, v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    if-lez v2, :cond_1

    .line 110
    iget v2, v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    int-to-float v2, v2

    iget v3, v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    iput v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->ratio:F

    .line 114
    :goto_1
    iget-object v2, p1, Lcom/vkontakte/android/Photo;->accessKey:Ljava/lang/String;

    iput-object v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->accessKey:Ljava/lang/String;

    .line 115
    iget v2, p1, Lcom/vkontakte/android/Photo;->postID:I

    iput v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->postID:I

    .line 116
    iget-wide v2, p1, Lcom/vkontakte/android/Photo;->lat:D

    iput-wide v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->lat:D

    .line 117
    iget-wide v2, p1, Lcom/vkontakte/android/Photo;->lon:D

    iput-wide v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->lon:D

    .line 118
    return-void

    .line 112
    :cond_1
    const/high16 v2, -0x40800000    # -1.0f

    iput v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->ratio:F

    goto :goto_1
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;III)V
    .locals 7
    .param p1, "thumb"    # Ljava/lang/String;
    .param p2, "big"    # Ljava/lang/String;
    .param p3, "_oid"    # I
    .param p4, "_pid"    # I
    .param p5, "_aid"    # I

    .prologue
    .line 121
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;)V

    .line 122
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;)V
    .locals 16
    .param p1, "thumb"    # Ljava/lang/String;
    .param p2, "big"    # Ljava/lang/String;
    .param p3, "_oid"    # I
    .param p4, "_pid"    # I
    .param p5, "_aid"    # I
    .param p6, "_descr"    # Ljava/lang/String;

    .prologue
    .line 125
    const/4 v2, 0x2

    new-array v3, v2, [Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const/4 v2, 0x0

    new-instance v4, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const/16 v5, 0x6d

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v0, p1

    invoke-direct {v4, v5, v0, v6, v7}, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;-><init>(CLjava/lang/String;II)V

    aput-object v4, v3, v2

    const/4 v2, 0x1

    new-instance v4, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    const/16 v5, 0x78

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v0, p2

    invoke-direct {v4, v5, v0, v6, v7}, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;-><init>(CLjava/lang/String;II)V

    aput-object v4, v3, v2

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-string/jumbo v10, ""

    const/4 v11, 0x0

    const-wide v12, -0x3f3e6c0000000000L    # -9000.0

    const-wide v14, -0x3f3e6c0000000000L    # -9000.0

    move-object/from16 v2, p0

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move-object/from16 v7, p6

    invoke-direct/range {v2 .. v15}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>([Lcom/vkontakte/android/attachments/PhotoAttachment$Image;IIILjava/lang/String;IILjava/lang/String;IDD)V

    .line 126
    return-void
.end method

.method public constructor <init>(Ljava/util/HashMap;IIILjava/lang/String;)V
    .locals 4
    .param p2, "_oid"    # I
    .param p3, "_pid"    # I
    .param p4, "_aid"    # I
    .param p5, "_descr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/vkontakte/android/attachments/PhotoAttachment$Image;",
            ">;III",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "_images":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/vkontakte/android/attachments/PhotoAttachment$Image;>;"
    const-wide v2, -0x3f3e6c0000000000L    # -9000.0

    .line 73
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 30
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    .line 32
    const-string/jumbo v1, "m"

    iput-object v1, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->thumbType:Ljava/lang/String;

    .line 36
    iput-wide v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->lat:D

    .line 37
    iput-wide v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->lon:D

    .line 74
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 75
    iput p3, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->pid:I

    .line 76
    iput p2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->oid:I

    .line 77
    iput p4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->aid:I

    .line 78
    iput-object p5, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->descr:Ljava/lang/String;

    .line 80
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    const-string/jumbo v2, "x"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    .line 81
    .local v0, "im":Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    iget v1, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    if-lez v1, :cond_2

    iget v1, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    if-lez v1, :cond_2

    .line 82
    iget v1, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    int-to-float v1, v1

    iget v2, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    iput v1, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->ratio:F

    .line 87
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    const-string/jumbo v2, "x"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 88
    iget-object v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    sget v1, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v3

    if-gtz v1, :cond_0

    invoke-static {}, Lcom/vk/core/util/Screen;->isTablet()Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    const-string/jumbo v3, "y"

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string/jumbo v1, "y"

    :goto_1
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->url:Ljava/lang/String;

    iput-object v1, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->srcBig:Ljava/lang/String;

    .line 90
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    const-string/jumbo v2, "m"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->url:Ljava/lang/String;

    iput-object v1, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->srcThumb:Ljava/lang/String;

    .line 91
    return-void

    .line 84
    :cond_2
    const/high16 v1, -0x40800000    # -1.0f

    iput v1, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->ratio:F

    goto :goto_0

    .line 88
    :cond_3
    const-string/jumbo v1, "x"

    goto :goto_1
.end method

.method public constructor <init>([Lcom/vkontakte/android/attachments/PhotoAttachment$Image;IIILjava/lang/String;IILjava/lang/String;IDD)V
    .locals 10
    .param p1, "_images"    # [Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    .param p2, "_oid"    # I
    .param p3, "_pid"    # I
    .param p4, "_aid"    # I
    .param p5, "_descr"    # Ljava/lang/String;
    .param p6, "_uid"    # I
    .param p7, "_date"    # I
    .param p8, "akey"    # Ljava/lang/String;
    .param p9, "post"    # I
    .param p10, "lat"    # D
    .param p12, "lon"    # D

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 30
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    .line 32
    const-string/jumbo v4, "m"

    iput-object v4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->thumbType:Ljava/lang/String;

    .line 36
    const-wide v4, -0x3f3e6c0000000000L    # -9000.0

    iput-wide v4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->lat:D

    .line 37
    const-wide v4, -0x3f3e6c0000000000L    # -9000.0

    iput-wide v4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->lon:D

    .line 40
    array-length v5, p1

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v3, p1, v4

    .line 41
    .local v3, "img":Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    iget-object v6, v3, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->url:Ljava/lang/String;

    if-eqz v6, :cond_0

    .line 42
    iget-object v6, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-char v8, v3, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->type:C

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 45
    .end local v3    # "img":Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    :cond_1
    iput p3, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->pid:I

    .line 46
    iput p2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->oid:I

    .line 47
    iput p4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->aid:I

    .line 48
    iput-object p5, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->descr:Ljava/lang/String;

    .line 49
    move/from16 v0, p6

    iput v0, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->uid:I

    .line 50
    move/from16 v0, p7

    iput v0, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->date:I

    .line 51
    move-object/from16 v0, p8

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->accessKey:Ljava/lang/String;

    .line 52
    move/from16 v0, p9

    iput v0, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->postID:I

    .line 54
    iget-object v4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    const-string/jumbo v5, "x"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    .line 55
    .local v2, "im":Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    if-eqz v2, :cond_3

    iget v4, v2, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    if-lez v4, :cond_3

    iget v4, v2, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    if-lez v4, :cond_3

    .line 56
    iget v4, v2, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    int-to-float v4, v4

    iget v5, v2, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    int-to-float v5, v5

    div-float/2addr v4, v5

    iput v4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->ratio:F

    .line 61
    :goto_1
    iget-object v4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    const-string/jumbo v5, "x"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 62
    iget-object v5, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    sget v4, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v6, 0x3f800000    # 1.0f

    cmpl-float v4, v4, v6

    if-gtz v4, :cond_2

    invoke-static {}, Lcom/vk/core/util/Screen;->isTablet()Z

    move-result v4

    if-eqz v4, :cond_4

    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    const-string/jumbo v6, "y"

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string/jumbo v4, "y"

    :goto_2
    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    iget-object v4, v4, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->url:Ljava/lang/String;

    iput-object v4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->srcBig:Ljava/lang/String;

    .line 68
    :goto_3
    iget-object v4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    const-string/jumbo v5, "m"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    iget-object v4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    const-string/jumbo v5, "m"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    iget-object v4, v4, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->url:Ljava/lang/String;

    :goto_4
    iput-object v4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->srcThumb:Ljava/lang/String;

    .line 69
    move-wide/from16 v0, p10

    iput-wide v0, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->lat:D

    .line 70
    move-wide/from16 v0, p12

    iput-wide v0, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->lon:D

    .line 71
    return-void

    .line 58
    :cond_3
    const/high16 v4, -0x40800000    # -1.0f

    iput v4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->ratio:F

    goto :goto_1

    .line 62
    :cond_4
    const-string/jumbo v4, "x"

    goto :goto_2

    .line 64
    :cond_5
    const-string/jumbo v4, "http://vk.com/images/x_null.gif"

    iput-object v4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->srcBig:Ljava/lang/String;

    goto :goto_3

    .line 68
    :cond_6
    const-string/jumbo v4, "http://vk.com/images/x_null.gif"

    goto :goto_4
.end method

.method private getThumbType(IILjava/util/HashMap;)Ljava/lang/String;
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/vkontakte/android/attachments/PhotoAttachment$Image;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 254
    .local p3, "imgs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/vkontakte/android/attachments/PhotoAttachment$Image;>;"
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 255
    .local v0, "max_s":I
    const/16 v1, 0x4b

    if-gt v0, v1, :cond_0

    .line 256
    const-string/jumbo v1, "s"

    .line 270
    :goto_0
    return-object v1

    .line 257
    :cond_0
    const/16 v1, 0x82

    if-ge v0, v1, :cond_1

    .line 258
    const-string/jumbo v1, "m"

    goto :goto_0

    .line 259
    :cond_1
    const-string/jumbo v1, "j"

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x12c

    if-ge v0, v1, :cond_2

    .line 260
    const-string/jumbo v1, "j"

    goto :goto_0

    .line 261
    :cond_2
    const-string/jumbo v1, "o"

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string/jumbo v1, "o"

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    iget v1, v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    if-lt v1, p1, :cond_3

    const-string/jumbo v1, "o"

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    iget v1, v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    if-lt v1, p2, :cond_3

    .line 262
    const-string/jumbo v1, "o"

    goto :goto_0

    .line 263
    :cond_3
    const-string/jumbo v1, "p"

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string/jumbo v1, "p"

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    iget v1, v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    if-lt v1, p1, :cond_4

    const-string/jumbo v1, "p"

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    iget v1, v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    if-lt v1, p2, :cond_4

    .line 264
    const-string/jumbo v1, "p"

    goto :goto_0

    .line 265
    :cond_4
    const-string/jumbo v1, "q"

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    const-string/jumbo v1, "q"

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    iget v1, v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    if-lt v1, p1, :cond_5

    const-string/jumbo v1, "q"

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    iget v1, v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    if-lt v1, p2, :cond_5

    .line 266
    const-string/jumbo v1, "q"

    goto/16 :goto_0

    .line 267
    :cond_5
    const-string/jumbo v1, "r"

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    const-string/jumbo v1, "r"

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    iget v1, v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    if-lt v1, p1, :cond_6

    const-string/jumbo v1, "r"

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    iget v1, v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    if-lt v1, p2, :cond_6

    .line 268
    const-string/jumbo v1, "r"

    goto/16 :goto_0

    .line 270
    :cond_6
    const-string/jumbo v1, "x"

    goto/16 :goto_0
.end method


# virtual methods
.method public bind(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 315
    check-cast p1, Lcom/vk/imageloader/view/VKImageView;

    .end local p1    # "view":Landroid/view/View;
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/PhotoAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 316
    return-void
.end method

.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 169
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/attachments/PhotoAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 292
    iget v0, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->displayH:I

    return v0
.end method

.method public getImageURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 310
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/PhotoAttachment;->getThumbURL()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRatio()F
    .locals 1

    .prologue
    .line 229
    iget v0, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->ratio:F

    return v0
.end method

.method public getThumbURL()Ljava/lang/String;
    .locals 3

    .prologue
    .line 297
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->thumbType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->url:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 301
    :goto_0
    return-object v1

    .line 298
    :catch_0
    move-exception v0

    .line 299
    .local v0, "x":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 301
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    .line 173
    const-string/jumbo v2, "photo"

    invoke-static {p1, v2}, Lcom/vkontakte/android/attachments/PhotoAttachment;->getReusableView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/PhotoAttachment$FixedSizeImageView;

    .line 174
    .local v0, "iv":Lcom/vkontakte/android/attachments/PhotoAttachment$FixedSizeImageView;
    const v2, 0x7f020338

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/attachments/PhotoAttachment$FixedSizeImageView;->setImageResource(I)V

    .line 175
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/attachments/PhotoAttachment$FixedSizeImageView;->setId(I)V

    .line 176
    iget-boolean v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->hasSize:Z

    if-eqz v2, :cond_4

    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    :goto_0
    invoke-virtual {v0, v2}, Lcom/vkontakte/android/attachments/PhotoAttachment$FixedSizeImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 177
    iget v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->displayW:I

    if-nez v2, :cond_0

    .line 178
    const/16 v2, 0x87

    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->displayW:I

    .line 180
    :cond_0
    iget v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->displayH:I

    if-nez v2, :cond_1

    .line 181
    const/16 v2, 0x64

    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->displayH:I

    .line 183
    :cond_1
    iget v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->displayH:I

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/attachments/PhotoAttachment$FixedSizeImageView;->setMinimumHeight(I)V

    .line 184
    iget v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->displayH:I

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/attachments/PhotoAttachment$FixedSizeImageView;->setMaxHeight(I)V

    .line 185
    iget v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->displayW:I

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/attachments/PhotoAttachment$FixedSizeImageView;->setMinimumWidth(I)V

    .line 186
    iget v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->displayW:I

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/attachments/PhotoAttachment$FixedSizeImageView;->setMaxWidth(I)V

    .line 187
    iget v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->displayW:I

    iget v3, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->displayH:I

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/attachments/PhotoAttachment$FixedSizeImageView;->setFixedSize(II)V

    .line 188
    invoke-static {}, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->CreateLayoutParamsForZhukovsLayout()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    move-result-object v1

    .line 189
    .local v1, "params":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    iget-boolean v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->breakAfter:Z

    if-nez v2, :cond_2

    iget-boolean v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->floating:Z

    if-eqz v2, :cond_3

    .line 190
    :cond_2
    iget-boolean v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->breakAfter:Z

    iput-boolean v2, v1, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->breakAfter:Z

    .line 191
    iget-boolean v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->floating:Z

    iput-boolean v2, v1, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->floating:Z

    .line 193
    :cond_3
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/attachments/PhotoAttachment$FixedSizeImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 194
    return-object v0

    .line 176
    .end local v1    # "params":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    :cond_4
    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    goto :goto_0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 287
    iget v0, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->displayW:I

    return v0
.end method

.method public getWidth(C)I
    .locals 3
    .param p1, "sz"    # C

    .prologue
    .line 233
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    iget v0, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    return v0
.end method

.method public overrideLayoutParams()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .locals 1

    .prologue
    .line 200
    const/4 v0, 0x0

    return-object v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 6
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 146
    iget-object v3, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    .line 147
    .local v2, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v3

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 148
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 149
    .local v1, "k":Ljava/lang/String;
    iget-object v4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    .line 150
    .local v0, "im":Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {p1, v4}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 151
    iget-object v4, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->url:Ljava/lang/String;

    invoke-virtual {p1, v4}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 152
    iget v4, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    invoke-virtual {p1, v4}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 153
    iget v4, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    invoke-virtual {p1, v4}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    goto :goto_0

    .line 155
    .end local v0    # "im":Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    .end local v1    # "k":Ljava/lang/String;
    :cond_0
    iget v3, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->oid:I

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 156
    iget v3, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->pid:I

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 157
    iget v3, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->aid:I

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 158
    iget-object v3, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->descr:Ljava/lang/String;

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 159
    iget v3, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->uid:I

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 160
    iget v3, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->date:I

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 161
    iget-object v3, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->accessKey:Ljava/lang/String;

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 162
    iget v3, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->postID:I

    invoke-virtual {p1, v3}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 163
    iget-wide v4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->lat:D

    invoke-virtual {p1, v4, v5}, Lcom/vkontakte/android/utils/Serializer;->writeDouble(D)V

    .line 164
    iget-wide v4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->lon:D

    invoke-virtual {p1, v4, v5}, Lcom/vkontakte/android/utils/Serializer;->writeDouble(D)V

    .line 165
    return-void
.end method

.method public setViewSize(FFZZ)V
    .locals 3
    .param p1, "width"    # F
    .param p2, "height"    # F
    .param p3, "breakAfter"    # Z
    .param p4, "floating"    # Z

    .prologue
    .line 276
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->displayW:I

    .line 277
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->displayH:I

    .line 278
    iget v0, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->displayW:I

    iget v1, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->displayH:I

    iget-object v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    invoke-direct {p0, v0, v1, v2}, Lcom/vkontakte/android/attachments/PhotoAttachment;->getThumbType(IILjava/util/HashMap;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->thumbType:Ljava/lang/String;

    .line 280
    iput-boolean p3, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->breakAfter:Z

    .line 281
    iput-boolean p4, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->floating:Z

    .line 282
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->hasSize:Z

    .line 283
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 305
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "photo"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->oid:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->pid:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->accessKey:Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "_"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/vkontakte/android/attachments/PhotoAttachment;->accessKey:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method
