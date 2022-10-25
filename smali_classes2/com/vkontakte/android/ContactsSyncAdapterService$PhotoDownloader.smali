.class Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoDownloader;
.super Ljava/lang/Object;
.source "ContactsSyncAdapterService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ContactsSyncAdapterService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PhotoDownloader"
.end annotation


# static fields
.field private static final SIZES_FALLBACK:[C


# instance fields
.field private final reqs:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;",
            ">;"
        }
    .end annotation
.end field

.field private startingInd:I

.field private step:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 639
    const/4 v0, 0x3

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoDownloader;->SIZES_FALLBACK:[C

    return-void

    nop

    :array_0
    .array-data 2
        0x7as
        0x79s
        0x78s
    .end array-data
.end method

.method public constructor <init>(Ljava/util/Vector;II)V
    .locals 0
    .param p2, "startingInd"    # I
    .param p3, "step"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Vector",
            "<",
            "Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;",
            ">;II)V"
        }
    .end annotation

    .prologue
    .line 646
    .local p1, "_reqs":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 647
    iput-object p1, p0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoDownloader;->reqs:Ljava/util/Vector;

    .line 648
    iput p2, p0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoDownloader;->startingInd:I

    .line 649
    iput p3, p0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoDownloader;->step:I

    .line 650
    return-void
.end method


# virtual methods
.method public run()V
    .locals 22

    .prologue
    .line 654
    sget-object v1, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string/jumbo v2, "caller_is_syncadapter"

    const-string/jumbo v3, "true"

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v12

    .line 656
    .local v12, "dataUri":Landroid/net/Uri;
    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoDownloader;->startingInd:I

    .line 658
    .local v10, "currentInd":I
    :goto_0
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoDownloader;->reqs:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v10, v1, :cond_7

    .line 660
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoDownloader;->reqs:Ljava/util/Vector;

    invoke-virtual {v1, v10}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;

    .line 662
    .local v19, "req":Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;
    move-object/from16 v0, p0

    iget v1, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoDownloader;->step:I

    add-int/2addr v10, v1

    .line 664
    move-object/from16 v0, v19

    iget-object v1, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->photo:Lcom/vkontakte/android/Photo;

    if-nez v1, :cond_1

    .line 665
    move-object/from16 v0, v19

    iget-object v1, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->url:Ljava/lang/String;

    invoke-static {v1}, Lcom/vk/core/network/Network;->getURL(Ljava/lang/String;)[B

    move-result-object v1

    move-object/from16 v0, v19

    iput-object v1, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->data:[B

    .line 694
    :goto_1
    :try_start_0
    move-object/from16 v0, v19

    iget v1, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->existingID:I

    if-lez v1, :cond_5

    .line 695
    invoke-static {v12}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v19

    iget v3, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->existingID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    .line 696
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    const-string/jumbo v2, "data15"

    move-object/from16 v0, v19

    iget-object v3, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->data:[B

    .line 697
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    const-string/jumbo v2, "data_sync1"

    move-object/from16 v0, v19

    iget-object v3, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->url:Ljava/lang/String;

    .line 698
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    const-string/jumbo v2, "is_super_primary"

    const/4 v3, 0x1

    .line 699
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    const-string/jumbo v2, "is_primary"

    const/4 v3, 0x1

    .line 700
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    .line 701
    invoke-virtual {v1}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v15

    .line 702
    .local v15, "op":Landroid/content/ContentProviderOperation;
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 703
    .local v16, "ops":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 704
    invoke-static {}, Lcom/vkontakte/android/ContactsSyncAdapterService;->access$700()Landroid/content/ContentResolver;

    move-result-object v1

    const-string/jumbo v2, "com.android.contacts"

    move-object/from16 v0, v16

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 726
    .end local v15    # "op":Landroid/content/ContentProviderOperation;
    .end local v16    # "ops":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    :cond_0
    :goto_2
    const-string/jumbo v2, "vk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Downloaded "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, v19

    iget v3, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->uid:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, " [size="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v19

    iget-object v1, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->data:[B

    if-eqz v1, :cond_6

    move-object/from16 v0, v19

    iget-object v1, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->data:[B

    array-length v1, v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :goto_3
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, "], "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, v19

    iget-object v3, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->url:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 668
    :cond_1
    const/4 v14, 0x0

    .line 669
    .local v14, "img":Lcom/vkontakte/android/Photo$Image;
    const/4 v9, 0x0

    .line 670
    .local v9, "closestSize":I
    :try_start_1
    sget-object v2, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoDownloader;->SIZES_FALLBACK:[C

    array-length v3, v2

    const/4 v1, 0x0

    :goto_4
    if-ge v1, v3, :cond_3

    aget-char v8, v2, v1

    .line 671
    .local v8, "c":C
    move-object/from16 v0, v19

    iget-object v4, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->photo:Lcom/vkontakte/android/Photo;

    invoke-virtual {v4, v8}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v13

    .line 672
    .local v13, "i":Lcom/vkontakte/android/Photo$Image;
    if-eqz v13, :cond_2

    .line 673
    iget v4, v13, Lcom/vkontakte/android/Photo$Image;->width:I

    int-to-float v4, v4

    move-object/from16 v0, v19

    iget-object v5, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->cropRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    move-result v5

    mul-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v20

    .line 674
    .local v20, "size":I
    invoke-static {}, Lcom/vkontakte/android/ContactsSyncAdapterService;->access$600()I

    move-result v4

    sub-int v4, v20, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    invoke-static {}, Lcom/vkontakte/android/ContactsSyncAdapterService;->access$600()I

    move-result v5

    sub-int v5, v9, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    if-ge v4, v5, :cond_2

    .line 675
    move/from16 v9, v20

    .line 676
    move-object v14, v13

    .line 670
    .end local v20    # "size":I
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 680
    .end local v8    # "c":C
    .end local v13    # "i":Lcom/vkontakte/android/Photo$Image;
    :cond_3
    if-nez v14, :cond_4

    .line 681
    move-object/from16 v0, v19

    iget-object v1, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->photo:Lcom/vkontakte/android/Photo;

    const/16 v2, 0x78

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v14

    .line 683
    :cond_4
    iget-object v1, v14, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    new-instance v2, Lcom/vk/imageloader/transform/AvatarCropTransform;

    move-object/from16 v0, v19

    iget-object v3, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->cropRect:Landroid/graphics/RectF;

    invoke-static {}, Lcom/vkontakte/android/ContactsSyncAdapterService;->access$600()I

    move-result v4

    invoke-direct {v2, v3, v4}, Lcom/vk/imageloader/transform/AvatarCropTransform;-><init>(Landroid/graphics/RectF;I)V

    invoke-static {v1, v2}, Lcom/vk/imageloader/VKImageLoader;->getBitmap(Landroid/net/Uri;Lcom/facebook/imagepipeline/request/Postprocessor;)Lio/reactivex/Observable;

    move-result-object v1

    invoke-static {v1}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/graphics/Bitmap;

    .line 684
    .local v7, "bmp":Landroid/graphics/Bitmap;
    new-instance v17, Ljava/io/ByteArrayOutputStream;

    invoke-direct/range {v17 .. v17}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 685
    .local v17, "out":Ljava/io/ByteArrayOutputStream;
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->WEBP:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v2, 0x55

    move-object/from16 v0, v17

    invoke-virtual {v7, v1, v2, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 686
    invoke-virtual/range {v17 .. v17}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    move-object/from16 v0, v19

    iput-object v1, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->data:[B

    .line 687
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    iget-object v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->photo:Lcom/vkontakte/android/Photo;

    iget v2, v2, Lcom/vkontakte/android/Photo;->ownerID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, v19

    iget-object v2, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->photo:Lcom/vkontakte/android/Photo;

    iget v2, v2, Lcom/vkontakte/android/Photo;->id:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, v19

    iput-object v1, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->url:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    .line 688
    .end local v7    # "bmp":Landroid/graphics/Bitmap;
    .end local v17    # "out":Ljava/io/ByteArrayOutputStream;
    :catch_0
    move-exception v21

    .line 689
    .local v21, "x":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    move-object/from16 v0, v21

    invoke-static {v1, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1

    .line 706
    .end local v9    # "closestSize":I
    .end local v14    # "img":Lcom/vkontakte/android/Photo$Image;
    .end local v21    # "x":Ljava/lang/Exception;
    :cond_5
    :try_start_2
    invoke-static {}, Lcom/vkontakte/android/ContactsSyncAdapterService;->access$700()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/ContactsContract$RawContacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string/jumbo v5, "_id"

    aput-object v5, v3, v4

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "sync1="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v19

    iget v5, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->uid:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 707
    .local v11, "cursor":Landroid/database/Cursor;
    if-eqz v11, :cond_0

    invoke-interface {v11}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_0

    .line 708
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    .line 709
    const/4 v1, 0x0

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v18

    .line 710
    .local v18, "rawContactID":I
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 711
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 712
    .restart local v16    # "ops":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    invoke-static {v12}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    const-string/jumbo v2, "raw_contact_id"

    .line 713
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    const-string/jumbo v2, "mimetype"

    const-string/jumbo v3, "vnd.android.cursor.item/photo"

    .line 714
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    const-string/jumbo v2, "data15"

    move-object/from16 v0, v19

    iget-object v3, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->data:[B

    .line 715
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    const-string/jumbo v2, "is_super_primary"

    const/4 v3, 0x1

    .line 716
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    const-string/jumbo v2, "is_primary"

    const/4 v3, 0x1

    .line 717
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    const-string/jumbo v2, "data_sync1"

    move-object/from16 v0, v19

    iget-object v3, v0, Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;->url:Ljava/lang/String;

    .line 718
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v1

    .line 719
    invoke-virtual {v1}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v1

    .line 712
    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 720
    invoke-static {}, Lcom/vkontakte/android/ContactsSyncAdapterService;->access$700()Landroid/content/ContentResolver;

    move-result-object v1

    const-string/jumbo v2, "com.android.contacts"

    move-object/from16 v0, v16

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_2

    .line 723
    .end local v11    # "cursor":Landroid/database/Cursor;
    .end local v16    # "ops":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    .end local v18    # "rawContactID":I
    :catch_1
    move-exception v21

    .line 724
    .restart local v21    # "x":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    move-object/from16 v0, v21

    invoke-static {v1, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2

    .line 726
    .end local v21    # "x":Ljava/lang/Exception;
    :cond_6
    const-string/jumbo v1, "NULL"

    goto/16 :goto_3

    .line 729
    .end local v19    # "req":Lcom/vkontakte/android/ContactsSyncAdapterService$PhotoUpdateRequest;
    :cond_7
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "Photo DL thread exiting"

    invoke-static {v1, v2}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 731
    :try_start_3
    invoke-static {}, Lcom/vkontakte/android/ContactsSyncAdapterService;->access$800()Ljava/util/concurrent/CyclicBarrier;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/CyclicBarrier;->await()I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 734
    :goto_5
    return-void

    .line 732
    :catch_2
    move-exception v1

    goto :goto_5
.end method
