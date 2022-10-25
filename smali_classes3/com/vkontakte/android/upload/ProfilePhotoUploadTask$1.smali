.class Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$1;
.super Ljava/lang/Object;
.source "ProfilePhotoUploadTask.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->getServer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$1;->this$0:Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 116
    const-string/jumbo v0, "vk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Error getting upload server "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 72
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$1;->success(Ljava/lang/String;)V

    return-void
.end method

.method public success(Ljava/lang/String;)V
    .locals 17
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 75
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$1;->this$0:Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    move-object/from16 v0, p1

    iput-object v0, v14, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->server:Ljava/lang/String;

    .line 76
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$1;->this$0:Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    invoke-static {v14}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->access$000(Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;)F

    move-result v14

    const/4 v15, 0x0

    cmpl-float v14, v14, v15

    if-lez v14, :cond_2

    .line 78
    const/4 v10, 0x0

    .line 79
    .local v10, "reverseThePolarity":Z
    :try_start_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$1;->this$0:Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    iget-object v14, v14, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->file:Ljava/lang/String;

    const-string/jumbo v15, "content:"

    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_1

    .line 80
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$1;->this$0:Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    iget-object v14, v14, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->file:Ljava/lang/String;

    invoke-static {v14}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v14

    invoke-static {v14}, Lcom/vkontakte/android/upload/UploadUtils;->resolvePath(Landroid/net/Uri;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v9

    .line 81
    .local v9, "realName":Ljava/lang/String;
    if-eqz v9, :cond_1

    .line 83
    :try_start_1
    new-instance v3, Landroid/media/ExifInterface;

    invoke-direct {v3, v9}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 84
    .local v3, "exif":Landroid/media/ExifInterface;
    const-string/jumbo v14, "Orientation"

    const/4 v15, 0x0

    invoke-virtual {v3, v14, v15}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v8

    .line 85
    .local v8, "orientation":I
    const/16 v14, 0x8

    if-eq v8, v14, :cond_0

    const/4 v14, 0x6

    if-ne v8, v14, :cond_3

    :cond_0
    const/4 v10, 0x1

    .line 92
    .end local v3    # "exif":Landroid/media/ExifInterface;
    .end local v8    # "orientation":I
    .end local v9    # "realName":Ljava/lang/String;
    :cond_1
    :goto_0
    :try_start_2
    new-instance v7, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v7}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 93
    .local v7, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v14, 0x1

    iput-boolean v14, v7, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 94
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$1;->this$0:Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    iget-object v14, v14, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->context:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$1;->this$0:Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    iget-object v15, v15, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->file:Ljava/lang/String;

    invoke-static {v15}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v15

    const-string/jumbo v16, "r"

    invoke-virtual/range {v14 .. v16}, Landroid/content/ContentResolver;->openAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v4

    .line 95
    .local v4, "f":Landroid/content/res/AssetFileDescriptor;
    invoke-virtual {v4}, Landroid/content/res/AssetFileDescriptor;->createInputStream()Ljava/io/FileInputStream;

    move-result-object v5

    .line 96
    .local v5, "is":Ljava/io/FileInputStream;
    const/4 v14, 0x0

    invoke-static {v5, v14, v7}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 99
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$1;->this$0:Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    invoke-static {v14}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->access$000(Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;)F

    move-result v15

    if-eqz v10, :cond_4

    iget v14, v7, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    :goto_1
    int-to-float v14, v14

    mul-float/2addr v14, v15

    float-to-int v6, v14

    .line 100
    .local v6, "left":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$1;->this$0:Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    invoke-static {v14}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->access$100(Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;)F

    move-result v15

    if-eqz v10, :cond_5

    iget v14, v7, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    :goto_2
    int-to-float v14, v14

    mul-float/2addr v14, v15

    float-to-int v12, v14

    .line 101
    .local v12, "top":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$1;->this$0:Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    invoke-static {v14}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->access$200(Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;)F

    move-result v15

    if-eqz v10, :cond_6

    iget v14, v7, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    :goto_3
    int-to-float v14, v14

    mul-float/2addr v14, v15

    float-to-int v11, v14

    .line 102
    .local v11, "right":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$1;->this$0:Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    invoke-static {v14}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->access$300(Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;)F

    move-result v15

    if-eqz v10, :cond_7

    iget v14, v7, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    :goto_4
    int-to-float v14, v14

    mul-float/2addr v14, v15

    float-to-int v1, v14

    .line 103
    .local v1, "bottom":I
    sub-int v14, v11, v6

    sub-int v15, v1, v12

    invoke-static {v14, v15}, Ljava/lang/Math;->min(II)I

    move-result v13

    .line 105
    .local v13, "width":I
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask$1;->this$0:Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    iget-object v0, v15, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->server:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v16, "&_square_crop="

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const/16 v16, 0x2c

    move/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const/16 v16, 0x2c

    move/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v16, "&_full="

    move-object/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const/16 v16, 0x2c

    move/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const/16 v16, 0x2c

    move/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    sub-int v16, v11, v6

    move/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const/16 v16, 0x2c

    move/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    sub-int v16, v1, v12

    move/from16 v0, v16

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    iput-object v14, v15, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;->server:Ljava/lang/String;

    .line 112
    .end local v1    # "bottom":I
    .end local v4    # "f":Landroid/content/res/AssetFileDescriptor;
    .end local v5    # "is":Ljava/io/FileInputStream;
    .end local v6    # "left":I
    .end local v7    # "options":Landroid/graphics/BitmapFactory$Options;
    .end local v10    # "reverseThePolarity":Z
    .end local v11    # "right":I
    .end local v12    # "top":I
    .end local v13    # "width":I
    :cond_2
    :goto_5
    return-void

    .line 85
    .restart local v3    # "exif":Landroid/media/ExifInterface;
    .restart local v8    # "orientation":I
    .restart local v9    # "realName":Ljava/lang/String;
    .restart local v10    # "reverseThePolarity":Z
    :cond_3
    const/4 v10, 0x0

    goto/16 :goto_0

    .line 86
    .end local v3    # "exif":Landroid/media/ExifInterface;
    .end local v8    # "orientation":I
    :catch_0
    move-exception v2

    .line 87
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_0

    .line 107
    .end local v2    # "e":Ljava/io/IOException;
    .end local v9    # "realName":Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 108
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_5

    .line 99
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v4    # "f":Landroid/content/res/AssetFileDescriptor;
    .restart local v5    # "is":Ljava/io/FileInputStream;
    .restart local v7    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_4
    :try_start_3
    iget v14, v7, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    goto/16 :goto_1

    .line 100
    .restart local v6    # "left":I
    :cond_5
    iget v14, v7, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    goto/16 :goto_2

    .line 101
    .restart local v12    # "top":I
    :cond_6
    iget v14, v7, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    goto/16 :goto_3

    .line 102
    .restart local v11    # "right":I
    :cond_7
    iget v14, v7, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_4
.end method
