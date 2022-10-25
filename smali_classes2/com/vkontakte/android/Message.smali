.class public Lcom/vkontakte/android/Message;
.super Lcom/vkontakte/android/utils/MessageBase;
.source "Message.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/Message$FwdMessage;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final FLAG_FAILED:I = 0x2

.field public static final FLAG_SERVICE:I = 0x4

.field public static final FLAG_UNREAD:I = 0x1

.field public static final SELECTION:[Ljava/lang/String;


# instance fields
.field public extras:Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field public isServiceMessage:Z

.field public out:Z

.field public peer:I

.field public randomId:I

.field public readState:Z

.field public sendFailed:Z

.field public title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 216
    const/16 v0, 0xa

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "mid"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "peer"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "random_id"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "sender"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "text"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "time"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "flags"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "attachments"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string/jumbo v2, "fwd"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string/jumbo v2, "extras"

    aput-object v2, v0, v1

    sput-object v0, Lcom/vkontakte/android/Message;->SELECTION:[Ljava/lang/String;

    .line 390
    new-instance v0, Lcom/vkontakte/android/Message$1;

    invoke-direct {v0}, Lcom/vkontakte/android/Message$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/Message;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 83
    invoke-direct {p0}, Lcom/vkontakte/android/utils/MessageBase;-><init>()V

    .line 37
    iput-boolean v0, p0, Lcom/vkontakte/android/Message;->out:Z

    .line 39
    iput-boolean v0, p0, Lcom/vkontakte/android/Message;->sendFailed:Z

    .line 40
    iput-boolean v0, p0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    .line 41
    iput-boolean v0, p0, Lcom/vkontakte/android/Message;->readState:Z

    .line 47
    sget-object v0, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    iput-object v0, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    .line 84
    return-void
.end method

.method public constructor <init>(Landroid/content/ContentValues;)V
    .locals 16
    .param p1, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 272
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/utils/MessageBase;-><init>()V

    .line 37
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/Message;->out:Z

    .line 39
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/Message;->sendFailed:Z

    .line 40
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    .line 41
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/Message;->readState:Z

    .line 47
    sget-object v14, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    .line 274
    :try_start_0
    const-string/jumbo v14, "mid"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/vkontakte/android/Message;->id:I

    .line 275
    const-string/jumbo v14, "peer"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/vkontakte/android/Message;->peer:I

    .line 276
    const-string/jumbo v14, "random_id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/vkontakte/android/Message;->randomId:I

    .line 277
    const-string/jumbo v14, "sender"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/vkontakte/android/Message;->sender:I

    .line 278
    const-string/jumbo v14, "text"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/vkontakte/android/Message;->setText(Ljava/lang/String;)V

    .line 279
    const-string/jumbo v14, "time"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/vkontakte/android/Message;->time:I

    .line 280
    const-string/jumbo v14, "flags"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 281
    .local v3, "flags":I
    and-int/lit8 v14, v3, 0x1

    if-nez v14, :cond_1

    const/4 v14, 0x1

    :goto_0
    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/Message;->readState:Z

    .line 282
    and-int/lit8 v14, v3, 0x2

    if-lez v14, :cond_2

    const/4 v14, 0x1

    :goto_1
    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/Message;->sendFailed:Z

    .line 283
    and-int/lit8 v14, v3, 0x4

    if-lez v14, :cond_3

    const/4 v14, 0x1

    :goto_2
    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    .line 284
    const-string/jumbo v14, "attachments"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/ContentValues;->getAsByteArray(Ljava/lang/String;)[B

    move-result-object v2

    .line 285
    .local v2, "att":[B
    if-eqz v2, :cond_4

    .line 286
    new-instance v6, Ljava/io/DataInputStream;

    new-instance v14, Ljava/io/ByteArrayInputStream;

    invoke-direct {v14, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v6, v14}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 287
    .local v6, "is":Ljava/io/DataInputStream;
    invoke-virtual {v6}, Ljava/io/DataInputStream;->read()I

    move-result v9

    .line 288
    .local v9, "num":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_3
    if-ge v5, v9, :cond_4

    .line 289
    invoke-static {v6}, Lcom/vkontakte/android/attachments/Attachment;->deserialize(Ljava/io/DataInputStream;)Lcom/vkontakte/android/attachments/Attachment;

    move-result-object v1

    .line 290
    .local v1, "a":Lcom/vkontakte/android/attachments/Attachment;
    if-eqz v1, :cond_0

    .line 291
    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v9}, Lcom/vkontakte/android/Message;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;I)V

    .line 288
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 281
    .end local v1    # "a":Lcom/vkontakte/android/attachments/Attachment;
    .end local v2    # "att":[B
    .end local v5    # "i":I
    .end local v6    # "is":Ljava/io/DataInputStream;
    .end local v9    # "num":I
    :cond_1
    const/4 v14, 0x0

    goto :goto_0

    .line 282
    :cond_2
    const/4 v14, 0x0

    goto :goto_1

    .line 283
    :cond_3
    const/4 v14, 0x0

    goto :goto_2

    .line 295
    .restart local v2    # "att":[B
    :cond_4
    const-string/jumbo v14, "fwd"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/ContentValues;->getAsByteArray(Ljava/lang/String;)[B

    move-result-object v4

    .line 296
    .local v4, "fwd":[B
    if-eqz v4, :cond_5

    .line 297
    new-instance v6, Ljava/io/DataInputStream;

    new-instance v14, Ljava/io/ByteArrayInputStream;

    invoke-direct {v14, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v6, v14}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 298
    .restart local v6    # "is":Ljava/io/DataInputStream;
    invoke-virtual {v6}, Ljava/io/DataInputStream;->read()I

    move-result v9

    .line 299
    .restart local v9    # "num":I
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_4
    if-ge v5, v9, :cond_5

    .line 300
    invoke-static {v6}, Lcom/vkontakte/android/Message$FwdMessage;->deserialize(Ljava/io/DataInputStream;)Lcom/vkontakte/android/Message$FwdMessage;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v9}, Lcom/vkontakte/android/Message;->addFwdMessage(Lcom/vkontakte/android/Message$FwdMessage;I)V

    .line 299
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 303
    .end local v5    # "i":I
    .end local v6    # "is":Ljava/io/DataInputStream;
    .end local v9    # "num":I
    :cond_5
    move-object/from16 v0, p0

    iget v14, v0, Lcom/vkontakte/android/Message;->sender:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v15

    invoke-virtual {v15}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v15

    if-ne v14, v15, :cond_7

    const/4 v14, 0x1

    :goto_5
    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/Message;->out:Z

    .line 304
    const-string/jumbo v14, "extras"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 305
    .local v13, "xtra":Ljava/lang/String;
    if-eqz v13, :cond_6

    .line 306
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 307
    .local v11, "obj":Lorg/json/JSONObject;
    invoke-virtual {v11}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v8

    .line 308
    .local v8, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_6
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_6

    .line 309
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 310
    .local v7, "k":Ljava/lang/String;
    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    .line 311
    .local v10, "o":Ljava/lang/Object;
    instance-of v14, v10, Ljava/lang/Integer;

    if-eqz v14, :cond_8

    .line 312
    check-cast v10, Ljava/lang/Integer;

    .end local v10    # "o":Ljava/lang/Object;
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v14}, Lcom/vkontakte/android/Message;->putIntExtra(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_6

    .line 320
    .end local v2    # "att":[B
    .end local v3    # "flags":I
    .end local v4    # "fwd":[B
    .end local v7    # "k":Ljava/lang/String;
    .end local v8    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v11    # "obj":Lorg/json/JSONObject;
    .end local v13    # "xtra":Ljava/lang/String;
    :catch_0
    move-exception v12

    .line 321
    .local v12, "x":Ljava/lang/Exception;
    const-string/jumbo v14, "vk"

    const-string/jumbo v15, "error parsing message"

    invoke-static {v14, v15, v12}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 323
    .end local v12    # "x":Ljava/lang/Exception;
    :cond_6
    return-void

    .line 303
    .restart local v2    # "att":[B
    .restart local v3    # "flags":I
    .restart local v4    # "fwd":[B
    :cond_7
    const/4 v14, 0x0

    goto :goto_5

    .line 313
    .restart local v7    # "k":Ljava/lang/String;
    .restart local v8    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .restart local v10    # "o":Ljava/lang/Object;
    .restart local v11    # "obj":Lorg/json/JSONObject;
    .restart local v13    # "xtra":Ljava/lang/String;
    :cond_8
    :try_start_1
    instance-of v14, v10, Ljava/lang/Boolean;

    if-eqz v14, :cond_9

    .line 314
    check-cast v10, Ljava/lang/Boolean;

    .end local v10    # "o":Ljava/lang/Object;
    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v14}, Lcom/vkontakte/android/Message;->putBooleanExtra(Ljava/lang/String;Z)V

    goto :goto_6

    .line 316
    .restart local v10    # "o":Ljava/lang/Object;
    :cond_9
    check-cast v10, Ljava/lang/String;

    .end local v10    # "o":Ljava/lang/Object;
    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v10}, Lcom/vkontakte/android/Message;->putStringExtra(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_6
.end method

.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 16
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 219
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/utils/MessageBase;-><init>()V

    .line 37
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/Message;->out:Z

    .line 39
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/Message;->sendFailed:Z

    .line 40
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    .line 41
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/Message;->readState:Z

    .line 47
    sget-object v14, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    .line 221
    const/4 v14, 0x0

    :try_start_0
    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/vkontakte/android/Message;->id:I

    .line 222
    const/4 v14, 0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/vkontakte/android/Message;->peer:I

    .line 223
    const/4 v14, 0x2

    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/vkontakte/android/Message;->randomId:I

    .line 224
    const/4 v14, 0x3

    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/vkontakte/android/Message;->sender:I

    .line 225
    const/4 v14, 0x4

    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/vkontakte/android/Message;->setText(Ljava/lang/String;)V

    .line 226
    const/4 v14, 0x5

    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/vkontakte/android/Message;->time:I

    .line 227
    const/4 v14, 0x6

    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    .line 228
    .local v3, "flags":I
    and-int/lit8 v14, v3, 0x1

    if-nez v14, :cond_1

    const/4 v14, 0x1

    :goto_0
    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/Message;->readState:Z

    .line 229
    and-int/lit8 v14, v3, 0x2

    if-lez v14, :cond_2

    const/4 v14, 0x1

    :goto_1
    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/Message;->sendFailed:Z

    .line 230
    and-int/lit8 v14, v3, 0x4

    if-lez v14, :cond_3

    const/4 v14, 0x1

    :goto_2
    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    .line 231
    const/4 v14, 0x7

    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v2

    .line 232
    .local v2, "att":[B
    if-eqz v2, :cond_4

    .line 233
    new-instance v6, Ljava/io/DataInputStream;

    new-instance v14, Ljava/io/ByteArrayInputStream;

    invoke-direct {v14, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v6, v14}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 234
    .local v6, "is":Ljava/io/DataInputStream;
    invoke-virtual {v6}, Ljava/io/DataInputStream;->read()I

    move-result v9

    .line 235
    .local v9, "num":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_3
    if-ge v5, v9, :cond_4

    .line 236
    invoke-static {v6}, Lcom/vkontakte/android/attachments/Attachment;->deserialize(Ljava/io/DataInputStream;)Lcom/vkontakte/android/attachments/Attachment;

    move-result-object v1

    .line 237
    .local v1, "a":Lcom/vkontakte/android/attachments/Attachment;
    if-eqz v1, :cond_0

    .line 238
    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v9}, Lcom/vkontakte/android/Message;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;I)V

    .line 235
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 228
    .end local v1    # "a":Lcom/vkontakte/android/attachments/Attachment;
    .end local v2    # "att":[B
    .end local v5    # "i":I
    .end local v6    # "is":Ljava/io/DataInputStream;
    .end local v9    # "num":I
    :cond_1
    const/4 v14, 0x0

    goto :goto_0

    .line 229
    :cond_2
    const/4 v14, 0x0

    goto :goto_1

    .line 230
    :cond_3
    const/4 v14, 0x0

    goto :goto_2

    .line 242
    .restart local v2    # "att":[B
    :cond_4
    const/16 v14, 0x8

    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v4

    .line 243
    .local v4, "fwd":[B
    if-eqz v4, :cond_5

    .line 244
    new-instance v6, Ljava/io/DataInputStream;

    new-instance v14, Ljava/io/ByteArrayInputStream;

    invoke-direct {v14, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v6, v14}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 245
    .restart local v6    # "is":Ljava/io/DataInputStream;
    invoke-virtual {v6}, Ljava/io/DataInputStream;->read()I

    move-result v9

    .line 246
    .restart local v9    # "num":I
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_4
    if-ge v5, v9, :cond_5

    .line 247
    invoke-static {v6}, Lcom/vkontakte/android/Message$FwdMessage;->deserialize(Ljava/io/DataInputStream;)Lcom/vkontakte/android/Message$FwdMessage;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v9}, Lcom/vkontakte/android/Message;->addFwdMessage(Lcom/vkontakte/android/Message$FwdMessage;I)V

    .line 246
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 250
    .end local v5    # "i":I
    .end local v6    # "is":Ljava/io/DataInputStream;
    .end local v9    # "num":I
    :cond_5
    move-object/from16 v0, p0

    iget v14, v0, Lcom/vkontakte/android/Message;->sender:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v15

    invoke-virtual {v15}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v15

    if-ne v14, v15, :cond_7

    const/4 v14, 0x1

    :goto_5
    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/Message;->out:Z

    .line 251
    const/16 v14, 0x9

    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 252
    .local v13, "xtra":Ljava/lang/String;
    if-eqz v13, :cond_6

    .line 253
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 254
    .local v11, "obj":Lorg/json/JSONObject;
    invoke-virtual {v11}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v8

    .line 255
    .local v8, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_6
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_6

    .line 256
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 257
    .local v7, "k":Ljava/lang/String;
    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    .line 258
    .local v10, "o":Ljava/lang/Object;
    instance-of v14, v10, Ljava/lang/Integer;

    if-eqz v14, :cond_8

    .line 259
    check-cast v10, Ljava/lang/Integer;

    .end local v10    # "o":Ljava/lang/Object;
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v14}, Lcom/vkontakte/android/Message;->putIntExtra(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_6

    .line 267
    .end local v2    # "att":[B
    .end local v3    # "flags":I
    .end local v4    # "fwd":[B
    .end local v7    # "k":Ljava/lang/String;
    .end local v8    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v11    # "obj":Lorg/json/JSONObject;
    .end local v13    # "xtra":Ljava/lang/String;
    :catch_0
    move-exception v12

    .line 268
    .local v12, "x":Ljava/lang/Exception;
    const/4 v14, 0x0

    new-array v14, v14, [Ljava/lang/Object;

    invoke-static {v12, v14}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 270
    .end local v12    # "x":Ljava/lang/Exception;
    :cond_6
    return-void

    .line 250
    .restart local v2    # "att":[B
    .restart local v3    # "flags":I
    .restart local v4    # "fwd":[B
    :cond_7
    const/4 v14, 0x0

    goto :goto_5

    .line 260
    .restart local v7    # "k":Ljava/lang/String;
    .restart local v8    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .restart local v10    # "o":Ljava/lang/Object;
    .restart local v11    # "obj":Lorg/json/JSONObject;
    .restart local v13    # "xtra":Ljava/lang/String;
    :cond_8
    :try_start_1
    instance-of v14, v10, Ljava/lang/Boolean;

    if-eqz v14, :cond_9

    .line 261
    check-cast v10, Ljava/lang/Boolean;

    .end local v10    # "o":Ljava/lang/Object;
    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v14}, Lcom/vkontakte/android/Message;->putBooleanExtra(Ljava/lang/String;Z)V

    goto :goto_6

    .line 263
    .restart local v10    # "o":Ljava/lang/Object;
    :cond_9
    check-cast v10, Ljava/lang/String;

    .end local v10    # "o":Ljava/lang/Object;
    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v10}, Lcom/vkontakte/android/Message;->putStringExtra(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_6
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 14
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v11, 0x1

    const/4 v12, 0x0

    .line 86
    invoke-direct {p0}, Lcom/vkontakte/android/utils/MessageBase;-><init>()V

    .line 37
    iput-boolean v12, p0, Lcom/vkontakte/android/Message;->out:Z

    .line 39
    iput-boolean v12, p0, Lcom/vkontakte/android/Message;->sendFailed:Z

    .line 40
    iput-boolean v12, p0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    .line 41
    iput-boolean v12, p0, Lcom/vkontakte/android/Message;->readState:Z

    .line 47
    sget-object v13, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    iput-object v13, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    .line 88
    const/4 v13, 0x0

    :try_start_0
    invoke-virtual {p1, v13}, Landroid/os/Parcel;->readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;

    move-result-object v4

    .line 89
    .local v4, "bundle":Landroid/os/Bundle;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Landroid/os/Bundle;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_0

    .line 90
    iput-object v4, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    .line 92
    :cond_0
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {p0, v13}, Lcom/vkontakte/android/Message;->setText(Ljava/lang/String;)V

    .line 93
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v13

    iput-object v13, p0, Lcom/vkontakte/android/Message;->title:Ljava/lang/String;

    .line 94
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v13

    if-ne v13, v11, :cond_2

    move v13, v11

    :goto_0
    iput-boolean v13, p0, Lcom/vkontakte/android/Message;->out:Z

    .line 95
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v13

    if-ne v13, v11, :cond_3

    move v13, v11

    :goto_1
    iput-boolean v13, p0, Lcom/vkontakte/android/Message;->sendFailed:Z

    .line 96
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v13

    if-ne v13, v11, :cond_4

    move v13, v11

    :goto_2
    iput-boolean v13, p0, Lcom/vkontakte/android/Message;->readState:Z

    .line 97
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v13

    if-ne v13, v11, :cond_5

    :goto_3
    iput-boolean v11, p0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    .line 98
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    iput v11, p0, Lcom/vkontakte/android/Message;->time:I

    .line 99
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    iput v11, p0, Lcom/vkontakte/android/Message;->id:I

    .line 100
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    iput v11, p0, Lcom/vkontakte/android/Message;->sender:I

    .line 101
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    iput v11, p0, Lcom/vkontakte/android/Message;->peer:I

    .line 102
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    iput v11, p0, Lcom/vkontakte/android/Message;->randomId:I

    .line 104
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v7

    .line 106
    .local v7, "len":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_4
    if-ge v5, v7, :cond_6

    .line 107
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 109
    .local v2, "bl":I
    new-array v3, v2, [B

    .line 110
    .local v3, "buf":[B
    invoke-virtual {p1, v3}, Landroid/os/Parcel;->readByteArray([B)V

    .line 111
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 112
    .local v0, "ais":Ljava/io/ByteArrayInputStream;
    new-instance v6, Ljava/io/DataInputStream;

    invoke-direct {v6, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 113
    .local v6, "is":Ljava/io/DataInputStream;
    invoke-static {v6}, Lcom/vkontakte/android/attachments/Attachment;->deserialize(Ljava/io/DataInputStream;)Lcom/vkontakte/android/attachments/Attachment;

    move-result-object v1

    .line 114
    .local v1, "att":Lcom/vkontakte/android/attachments/Attachment;
    if-eqz v1, :cond_1

    .line 115
    invoke-virtual {p0, v1, v7}, Lcom/vkontakte/android/Message;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;I)V

    .line 106
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .end local v0    # "ais":Ljava/io/ByteArrayInputStream;
    .end local v1    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v2    # "bl":I
    .end local v3    # "buf":[B
    .end local v5    # "i":I
    .end local v6    # "is":Ljava/io/DataInputStream;
    .end local v7    # "len":I
    :cond_2
    move v13, v12

    .line 94
    goto :goto_0

    :cond_3
    move v13, v12

    .line 95
    goto :goto_1

    :cond_4
    move v13, v12

    .line 96
    goto :goto_2

    :cond_5
    move v11, v12

    .line 97
    goto :goto_3

    .line 118
    .restart local v5    # "i":I
    .restart local v7    # "len":I
    :cond_6
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v7

    .line 120
    const/4 v5, 0x0

    :goto_5
    if-ge v5, v7, :cond_7

    .line 121
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    new-array v9, v11, [B

    .line 122
    .local v9, "sdata":[B
    invoke-virtual {p1, v9}, Landroid/os/Parcel;->readByteArray([B)V

    .line 123
    new-instance v8, Ljava/io/DataInputStream;

    new-instance v11, Ljava/io/ByteArrayInputStream;

    invoke-direct {v11, v9}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v8, v11}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 124
    .local v8, "s":Ljava/io/DataInputStream;
    invoke-static {v8}, Lcom/vkontakte/android/Message$FwdMessage;->deserialize(Ljava/io/DataInputStream;)Lcom/vkontakte/android/Message$FwdMessage;

    move-result-object v11

    invoke-virtual {p0, v11, v7}, Lcom/vkontakte/android/Message;->addFwdMessage(Lcom/vkontakte/android/Message$FwdMessage;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .line 127
    .end local v4    # "bundle":Landroid/os/Bundle;
    .end local v5    # "i":I
    .end local v7    # "len":I
    .end local v8    # "s":Ljava/io/DataInputStream;
    .end local v9    # "sdata":[B
    :catch_0
    move-exception v10

    .line 128
    .local v10, "x":Ljava/lang/Exception;
    const-string/jumbo v11, "vk"

    invoke-static {v11, v10}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 130
    .end local v10    # "x":Ljava/lang/Exception;
    :cond_7
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/vkontakte/android/Message$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/vkontakte/android/Message$1;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/vkontakte/android/Message;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/Message;)V
    .locals 1
    .param p1, "m"    # Lcom/vkontakte/android/Message;

    .prologue
    const/4 v0, 0x0

    .line 132
    invoke-direct {p0}, Lcom/vkontakte/android/utils/MessageBase;-><init>()V

    .line 37
    iput-boolean v0, p0, Lcom/vkontakte/android/Message;->out:Z

    .line 39
    iput-boolean v0, p0, Lcom/vkontakte/android/Message;->sendFailed:Z

    .line 40
    iput-boolean v0, p0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    .line 41
    iput-boolean v0, p0, Lcom/vkontakte/android/Message;->readState:Z

    .line 47
    sget-object v0, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    iput-object v0, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    .line 133
    iget-object v0, p1, Lcom/vkontakte/android/Message;->text:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/Message;->setText(Ljava/lang/String;)V

    .line 134
    iget-object v0, p1, Lcom/vkontakte/android/Message;->title:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/Message;->title:Ljava/lang/String;

    .line 135
    iget v0, p1, Lcom/vkontakte/android/Message;->randomId:I

    iput v0, p0, Lcom/vkontakte/android/Message;->randomId:I

    .line 136
    iget-boolean v0, p1, Lcom/vkontakte/android/Message;->out:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/Message;->out:Z

    .line 137
    iget-boolean v0, p1, Lcom/vkontakte/android/Message;->sendFailed:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/Message;->sendFailed:Z

    .line 138
    iget-boolean v0, p1, Lcom/vkontakte/android/Message;->readState:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/Message;->readState:Z

    .line 139
    iget-boolean v0, p1, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    .line 140
    iget v0, p1, Lcom/vkontakte/android/Message;->time:I

    iput v0, p0, Lcom/vkontakte/android/Message;->time:I

    .line 141
    iget v0, p1, Lcom/vkontakte/android/Message;->id:I

    iput v0, p0, Lcom/vkontakte/android/Message;->id:I

    .line 142
    iget v0, p1, Lcom/vkontakte/android/Message;->sender:I

    iput v0, p0, Lcom/vkontakte/android/Message;->sender:I

    .line 143
    iget v0, p1, Lcom/vkontakte/android/Message;->peer:I

    iput v0, p0, Lcom/vkontakte/android/Message;->peer:I

    .line 144
    iget-object v0, p1, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/Message;->addAttachments(Ljava/util/Collection;)V

    .line 145
    iget-object v0, p1, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/Message;->addFwdMessages(Ljava/util/Collection;)V

    .line 146
    iget-object v0, p1, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/Message;->putAllExtra(Landroid/os/Bundle;)V

    .line 147
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "obj"    # Lorg/json/JSONObject;

    .prologue
    const/4 v0, 0x0

    .line 150
    invoke-direct {p0, p1, v0, v0}, Lcom/vkontakte/android/Message;-><init>(Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;)V

    .line 151
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;)V
    .locals 11
    .param p1, "obj"    # Lorg/json/JSONObject;
    .param p2    # Landroid/util/SparseArray;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/util/SparseArray;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 153
    .local p2, "users":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .local p3, "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/vkontakte/android/utils/MessageBase;-><init>()V

    .line 37
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/vkontakte/android/Message;->out:Z

    .line 39
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/vkontakte/android/Message;->sendFailed:Z

    .line 40
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    .line 41
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/vkontakte/android/Message;->readState:Z

    .line 47
    sget-object v8, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    iput-object v8, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    .line 155
    :try_start_0
    const-string/jumbo v8, "id"

    const-string/jumbo v9, "mid"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {p1, v8, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/Message;->id:I

    .line 156
    const-string/jumbo v8, "from_id"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 157
    const-string/jumbo v8, "from_id"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/Message;->sender:I

    .line 158
    const-string/jumbo v8, "chat_id"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_5

    const v8, 0x77359400

    const-string/jumbo v9, "chat_id"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    add-int/2addr v8, v9

    :goto_0
    iput v8, p0, Lcom/vkontakte/android/Message;->peer:I

    .line 166
    :goto_1
    const-string/jumbo v8, "body"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/vkontakte/android/Message;->setText(Ljava/lang/String;)V

    .line 167
    const-string/jumbo v8, "date"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/Message;->time:I

    .line 168
    const-string/jumbo v8, "title"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/vkontakte/android/Message;->title:Ljava/lang/String;

    .line 169
    const-string/jumbo v8, "random_id"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/Message;->randomId:I

    .line 170
    const-string/jumbo v8, "out"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_d

    const/4 v8, 0x1

    :goto_2
    iput-boolean v8, p0, Lcom/vkontakte/android/Message;->out:Z

    .line 171
    const-string/jumbo v8, "read_state"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_e

    const/4 v8, 0x1

    :goto_3
    iput-boolean v8, p0, Lcom/vkontakte/android/Message;->readState:Z

    .line 172
    const-string/jumbo v8, "action"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 173
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    .line 175
    const-string/jumbo v8, "action"

    const-string/jumbo v9, "action"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v8, v9}, Lcom/vkontakte/android/Message;->putStringExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    const-string/jumbo v8, "action_text"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 177
    const-string/jumbo v8, "action_text"

    const-string/jumbo v9, "action_text"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v8, v9}, Lcom/vkontakte/android/Message;->putStringExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    :cond_0
    const-string/jumbo v8, "action_mid"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 180
    const-string/jumbo v8, "action_mid"

    const-string/jumbo v9, "action_mid"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {p0, v8, v9}, Lcom/vkontakte/android/Message;->putIntExtra(Ljava/lang/String;I)V

    .line 182
    :cond_1
    const-string/jumbo v8, "action_email"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 183
    const-string/jumbo v8, "action_email"

    const-string/jumbo v9, "action_email"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v8, v9}, Lcom/vkontakte/android/Message;->putStringExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    :cond_2
    iget-object v8, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v9, "action_mid"

    invoke-virtual {v8, v9}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 187
    iget-object v8, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v9, "action_mid"

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 188
    .local v0, "actMid":I
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v8}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x3

    invoke-static {v8, v9}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;I)Ljava/util/ArrayList;

    move-result-object v6

    .line 189
    .local v6, "u":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const-string/jumbo v9, "action_user_name_acc"

    const/4 v8, 0x0

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/UserProfile;

    iget-object v8, v8, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {p0, v9, v8}, Lcom/vkontakte/android/Message;->putStringExtra(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    .end local v0    # "actMid":I
    .end local v6    # "u":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_3
    const-string/jumbo v8, "attachments"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_f

    .line 192
    const-string/jumbo v8, "attachments"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 193
    .local v2, "atts":Lorg/json/JSONArray;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_4
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v4, v8, :cond_f

    .line 194
    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    invoke-static {v8, p2, p3}, Lcom/vkontakte/android/attachments/Attachment;->parse(Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;)Lcom/vkontakte/android/attachments/Attachment;

    move-result-object v1

    .line 195
    .local v1, "att":Lcom/vkontakte/android/attachments/Attachment;
    if-eqz v1, :cond_4

    .line 196
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v8

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {p0, v1, v8}, Lcom/vkontakte/android/Message;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;I)V

    .line 193
    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 158
    .end local v1    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v2    # "atts":Lorg/json/JSONArray;
    .end local v4    # "i":I
    :cond_5
    const-string/jumbo v8, "user_id"

    const-string/jumbo v9, "from_id"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {p1, v8, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v8

    goto/16 :goto_0

    .line 159
    :cond_6
    const-string/jumbo v8, "uid"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 160
    const-string/jumbo v8, "out"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_8

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v8

    invoke-virtual {v8}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v8

    :goto_5
    iput v8, p0, Lcom/vkontakte/android/Message;->sender:I

    .line 161
    const-string/jumbo v8, "chat_id"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_9

    const v8, 0x77359400

    const-string/jumbo v9, "chat_id"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    add-int/2addr v8, v9

    :goto_6
    iput v8, p0, Lcom/vkontakte/android/Message;->peer:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    .line 211
    :catch_0
    move-exception v7

    .line 212
    .local v7, "x":Ljava/lang/Exception;
    const-string/jumbo v8, "vk"

    const-string/jumbo v9, "error parsing message"

    invoke-static {v8, v9, v7}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 214
    .end local v7    # "x":Ljava/lang/Exception;
    :cond_7
    :goto_7
    return-void

    .line 160
    :cond_8
    :try_start_1
    const-string/jumbo v8, "uid"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    goto :goto_5

    .line 161
    :cond_9
    const-string/jumbo v8, "uid"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    goto :goto_6

    .line 163
    :cond_a
    const-string/jumbo v8, "out"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_b

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v8

    invoke-virtual {v8}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v8

    :goto_8
    iput v8, p0, Lcom/vkontakte/android/Message;->sender:I

    .line 164
    const-string/jumbo v8, "chat_id"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_c

    const v8, 0x77359400

    const-string/jumbo v9, "chat_id"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    add-int/2addr v8, v9

    :goto_9
    iput v8, p0, Lcom/vkontakte/android/Message;->peer:I

    goto/16 :goto_1

    .line 163
    :cond_b
    const-string/jumbo v8, "user_id"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    goto :goto_8

    .line 164
    :cond_c
    const-string/jumbo v8, "user_id"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    goto :goto_9

    .line 170
    :cond_d
    const/4 v8, 0x0

    goto/16 :goto_2

    .line 171
    :cond_e
    const/4 v8, 0x0

    goto/16 :goto_3

    .line 200
    :cond_f
    iget-object v8, p0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-static {v8}, Lcom/vkontakte/android/attachments/Attachment;->sort(Ljava/util/List;)V

    .line 201
    const-string/jumbo v8, "fwd_messages"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_10

    .line 202
    const-string/jumbo v8, "fwd_messages"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 203
    .local v3, "fwds":Lorg/json/JSONArray;
    invoke-direct {p0, v3, p2, p3}, Lcom/vkontakte/android/Message;->parseFwdMessages(Lorg/json/JSONArray;Landroid/util/SparseArray;Landroid/util/SparseArray;)Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/vkontakte/android/Message;->addFwdMessages(Ljava/util/Collection;)V

    .line 205
    .end local v3    # "fwds":Lorg/json/JSONArray;
    :cond_10
    const-string/jumbo v8, "geo"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 206
    const-string/jumbo v8, "geo"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 207
    .local v5, "jg":Lorg/json/JSONObject;
    const-string/jumbo v8, "coordinates"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 208
    invoke-static {v5}, Lcom/vkontakte/android/attachments/Attachment;->parseGeo(Lorg/json/JSONObject;)Lcom/vkontakte/android/attachments/GeoAttachment;

    move-result-object v8

    const/4 v9, 0x1

    invoke-virtual {p0, v8, v9}, Lcom/vkontakte/android/Message;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_7
.end method

.method private parseFwdMessages(Lorg/json/JSONArray;Landroid/util/SparseArray;Landroid/util/SparseArray;)Ljava/util/ArrayList;
    .locals 10
    .param p1, "msgs"    # Lorg/json/JSONArray;
    .param p2    # Landroid/util/SparseArray;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/util/SparseArray;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Message$FwdMessage;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 470
    .local p2, "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .local p3, "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 471
    .local v7, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message$FwdMessage;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v2, v8, :cond_6

    .line 472
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 473
    .local v5, "jm":Lorg/json/JSONObject;
    new-instance v6, Lcom/vkontakte/android/Message$FwdMessage;

    invoke-direct {v6}, Lcom/vkontakte/android/Message$FwdMessage;-><init>()V

    .line 474
    .local v6, "m":Lcom/vkontakte/android/Message$FwdMessage;
    const-string/jumbo v8, "user_id"

    const-string/jumbo v9, "uid"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v5, v8, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v8

    iput v8, v6, Lcom/vkontakte/android/Message$FwdMessage;->sender:I

    .line 475
    const-string/jumbo v8, "date"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    iput v8, v6, Lcom/vkontakte/android/Message$FwdMessage;->time:I

    .line 476
    const-string/jumbo v8, "body"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Lcom/vkontakte/android/Message$FwdMessage;->setText(Ljava/lang/String;)V

    .line 477
    if-nez p2, :cond_1

    const-string/jumbo v8, "DELETED"

    :goto_1
    iput-object v8, v6, Lcom/vkontakte/android/Message$FwdMessage;->username:Ljava/lang/String;

    .line 478
    if-nez p3, :cond_2

    const-string/jumbo v8, "http://vk.com/images/camera_c.gif"

    :goto_2
    iput-object v8, v6, Lcom/vkontakte/android/Message$FwdMessage;->userphoto:Ljava/lang/String;

    .line 479
    const-string/jumbo v8, "attachments"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 480
    const-string/jumbo v8, "attachments"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 481
    .local v1, "atts":Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_3
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v3, v8, :cond_3

    .line 482
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    invoke-static {v8, p2, p3}, Lcom/vkontakte/android/attachments/Attachment;->parse(Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;)Lcom/vkontakte/android/attachments/Attachment;

    move-result-object v0

    .line 483
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    if-eqz v0, :cond_0

    .line 484
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v8

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v6, v0, v8}, Lcom/vkontakte/android/Message$FwdMessage;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;I)V

    .line 481
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 477
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v1    # "atts":Lorg/json/JSONArray;
    .end local v3    # "j":I
    :cond_1
    iget v8, v6, Lcom/vkontakte/android/Message$FwdMessage;->sender:I

    const-string/jumbo v9, "DELETED"

    invoke-virtual {p2, v8, v9}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    goto :goto_1

    .line 478
    :cond_2
    iget v8, v6, Lcom/vkontakte/android/Message$FwdMessage;->sender:I

    const-string/jumbo v9, "http://vk.com/images/camera_c.gif"

    invoke-virtual {p3, v8, v9}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    goto :goto_2

    .line 488
    :cond_3
    const-string/jumbo v8, "geo"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 489
    const-string/jumbo v8, "geo"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 490
    .local v4, "jg":Lorg/json/JSONObject;
    const-string/jumbo v8, "coordinates"

    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 491
    invoke-static {v4}, Lcom/vkontakte/android/attachments/Attachment;->parseGeo(Lorg/json/JSONObject;)Lcom/vkontakte/android/attachments/GeoAttachment;

    move-result-object v8

    const/4 v9, 0x1

    invoke-virtual {v6, v8, v9}, Lcom/vkontakte/android/Message$FwdMessage;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;I)V

    .line 494
    .end local v4    # "jg":Lorg/json/JSONObject;
    :cond_4
    iget-object v8, v6, Lcom/vkontakte/android/Message$FwdMessage;->attachments:Ljava/util/List;

    invoke-static {v8}, Lcom/vkontakte/android/attachments/Attachment;->sort(Ljava/util/List;)V

    .line 495
    const-string/jumbo v8, "fwd_messages"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 496
    const-string/jumbo v8, "fwd_messages"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    invoke-direct {p0, v8, p2, p3}, Lcom/vkontakte/android/Message;->parseFwdMessages(Lorg/json/JSONArray;Landroid/util/SparseArray;Landroid/util/SparseArray;)Ljava/util/ArrayList;

    move-result-object v8

    invoke-virtual {v6, v8}, Lcom/vkontakte/android/Message$FwdMessage;->addFwdMessages(Ljava/util/Collection;)V

    .line 498
    :cond_5
    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 471
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 500
    .end local v5    # "jm":Lorg/json/JSONObject;
    .end local v6    # "m":Lcom/vkontakte/android/Message$FwdMessage;
    :cond_6
    return-object v7
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 342
    const/4 v0, 0x0

    return v0
.end method

.method public forward()Lcom/vkontakte/android/Message$FwdMessage;
    .locals 2

    .prologue
    .line 456
    new-instance v0, Lcom/vkontakte/android/Message$FwdMessage;

    invoke-direct {v0}, Lcom/vkontakte/android/Message$FwdMessage;-><init>()V

    .line 457
    .local v0, "f":Lcom/vkontakte/android/Message$FwdMessage;
    iget v1, p0, Lcom/vkontakte/android/Message;->sender:I

    iput v1, v0, Lcom/vkontakte/android/Message$FwdMessage;->sender:I

    .line 458
    iget v1, p0, Lcom/vkontakte/android/Message;->time:I

    iput v1, v0, Lcom/vkontakte/android/Message$FwdMessage;->time:I

    .line 459
    iget-object v1, p0, Lcom/vkontakte/android/Message;->text:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/Message$FwdMessage;->text:Ljava/lang/String;

    .line 460
    iget-object v1, p0, Lcom/vkontakte/android/Message;->displayableText:Ljava/lang/CharSequence;

    iput-object v1, v0, Lcom/vkontakte/android/Message$FwdMessage;->displayableText:Ljava/lang/CharSequence;

    .line 461
    iget v1, p0, Lcom/vkontakte/android/Message;->id:I

    iput v1, v0, Lcom/vkontakte/android/Message$FwdMessage;->id:I

    .line 463
    iget-object v1, p0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/Message$FwdMessage;->addAttachments(Ljava/util/Collection;)V

    .line 464
    iget-object v1, p0, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/Message$FwdMessage;->addFwdMessages(Ljava/util/Collection;)V

    .line 465
    return-object v0
.end method

.method public generateRandomId()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 327
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getAccessToken()Ljava/lang/String;

    move-result-object v0

    .line 328
    .local v0, "accessToken":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x4

    if-lt v2, v3, :cond_0

    .line 329
    iget v2, p0, Lcom/vkontakte/android/Message;->id:I

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    shl-int/lit8 v4, v4, 0x8

    or-int/2addr v3, v4

    const/4 v4, 0x2

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    shl-int/lit8 v4, v4, 0x10

    or-int/2addr v3, v4

    const/4 v4, 0x3

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    shl-int/lit8 v4, v4, 0x18

    or-int/2addr v3, v4

    xor-int/2addr v2, v3

    iput v2, p0, Lcom/vkontakte/android/Message;->randomId:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 334
    .end local v0    # "accessToken":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 331
    :catch_0
    move-exception v1

    .line 332
    .local v1, "x":Ljava/lang/Exception;
    new-array v2, v5, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public getServiceMessageText(Lcom/vkontakte/android/UserProfile;Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p1, "senderProfile"    # Lcom/vkontakte/android/UserProfile;
    .param p2, "userAcc"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 405
    if-nez p1, :cond_0

    .line 406
    const-string/jumbo v1, "..."

    .line 452
    :goto_0
    return-object v1

    .line 408
    :cond_0
    const-string/jumbo v1, ""

    .line 409
    .local v1, "dtext":Ljava/lang/String;
    iget-object v4, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v5, "action"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 411
    .local v0, "act":Ljava/lang/String;
    const-string/jumbo v4, "chat_pin_message"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 412
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget-boolean v4, p1, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v4, :cond_1

    const v4, 0x7f08013a

    :goto_1
    new-array v6, v9, [Ljava/lang/Object;

    iget-object v7, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v7, v6, v8

    invoke-virtual {v5, v4, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    const v4, 0x7f08013b

    goto :goto_1

    .line 413
    :cond_2
    const-string/jumbo v4, "chat_unpin_message"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 414
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget-boolean v4, p1, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v4, :cond_3

    const v4, 0x7f080140

    :goto_2
    new-array v6, v9, [Ljava/lang/Object;

    iget-object v7, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v7, v6, v8

    invoke-virtual {v5, v4, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_3
    const v4, 0x7f080141

    goto :goto_2

    .line 415
    :cond_4
    const-string/jumbo v4, "chat_photo_update"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 416
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget-boolean v4, p1, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v4, :cond_5

    const v4, 0x7f080138

    :goto_3
    new-array v6, v9, [Ljava/lang/Object;

    iget-object v7, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v7, v6, v8

    invoke-virtual {v5, v4, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_5
    const v4, 0x7f080139

    goto :goto_3

    .line 417
    :cond_6
    const-string/jumbo v4, "chat_photo_remove"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 418
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget-boolean v4, p1, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v4, :cond_7

    const v4, 0x7f080136

    :goto_4
    new-array v6, v9, [Ljava/lang/Object;

    iget-object v7, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v7, v6, v8

    invoke-virtual {v5, v4, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    :cond_7
    const v4, 0x7f080137

    goto :goto_4

    .line 419
    :cond_8
    const-string/jumbo v4, "chat_create"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 420
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget-boolean v4, p1, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v4, :cond_9

    const v4, 0x7f0805fe

    :goto_5
    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v7, v6, v8

    iget-object v7, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v8, "action_text"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {v5, v4, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    :cond_9
    const v4, 0x7f0805ff

    goto :goto_5

    .line 421
    :cond_a
    const-string/jumbo v4, "chat_title_update"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 422
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget-boolean v4, p1, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v4, :cond_b

    const v4, 0x7f080600

    :goto_6
    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v7, v6, v8

    iget-object v7, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v8, "action_text"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {v5, v4, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    :cond_b
    const v4, 0x7f080601

    goto :goto_6

    .line 423
    :cond_c
    const-string/jumbo v4, "chat_invite_user"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 424
    iget-object v4, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v5, "action_mid"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 425
    .local v3, "uid":I
    iget v4, p0, Lcom/vkontakte/android/Message;->sender:I

    if-ne v3, v4, :cond_e

    .line 426
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget-boolean v4, p1, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v4, :cond_d

    const v4, 0x7f080608

    :goto_7
    new-array v6, v9, [Ljava/lang/Object;

    iget-object v7, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v7, v6, v8

    invoke-virtual {v5, v4, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    :cond_d
    const v4, 0x7f080609

    goto :goto_7

    .line 429
    :cond_e
    iget-object v4, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v5, "action_email"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 430
    iget-object v4, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v5, "action_email"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 434
    .local v2, "name":Ljava/lang/String;
    :goto_8
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget-boolean v4, p1, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v4, :cond_10

    const v4, 0x7f080602

    :goto_9
    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v7, v6, v8

    aput-object v2, v6, v9

    invoke-virtual {v5, v4, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 432
    .end local v2    # "name":Ljava/lang/String;
    :cond_f
    move-object v2, p2

    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_8

    .line 434
    :cond_10
    const v4, 0x7f080603

    goto :goto_9

    .line 436
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "uid":I
    :cond_11
    const-string/jumbo v4, "chat_kick_user"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_16

    .line 437
    iget-object v4, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v5, "action_mid"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 438
    .restart local v3    # "uid":I
    iget v4, p0, Lcom/vkontakte/android/Message;->sender:I

    if-ne v3, v4, :cond_13

    .line 439
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget-boolean v4, p1, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v4, :cond_12

    const v4, 0x7f080606

    :goto_a
    new-array v6, v9, [Ljava/lang/Object;

    iget-object v7, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v7, v6, v8

    invoke-virtual {v5, v4, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    :cond_12
    const v4, 0x7f080607

    goto :goto_a

    .line 442
    :cond_13
    iget-object v4, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v5, "action_email"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_14

    .line 443
    iget-object v4, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v5, "action_email"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 447
    .restart local v2    # "name":Ljava/lang/String;
    :goto_b
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget-boolean v4, p1, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v4, :cond_15

    const v4, 0x7f080604

    :goto_c
    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v7, v6, v8

    aput-object v2, v6, v9

    invoke-virtual {v5, v4, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_0

    .line 445
    .end local v2    # "name":Ljava/lang/String;
    :cond_14
    move-object v2, p2

    .restart local v2    # "name":Ljava/lang/String;
    goto :goto_b

    .line 447
    :cond_15
    const v4, 0x7f080605

    goto :goto_c

    .line 450
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "uid":I
    :cond_16
    const-string/jumbo v1, ""

    goto/16 :goto_0
.end method

.method public putAllExtra(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "value"    # Landroid/os/Bundle;

    .prologue
    .line 72
    invoke-virtual {p1}, Landroid/os/Bundle;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 79
    :goto_0
    return-void

    .line 75
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    sget-object v1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    if-ne v0, v1, :cond_1

    .line 76
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    .line 78
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    goto :goto_0
.end method

.method public putBooleanExtra(Ljava/lang/String;Z)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # Z

    .prologue
    .line 65
    iget-object v0, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    sget-object v1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    if-ne v0, v1, :cond_0

    .line 66
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    .line 68
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 69
    return-void
.end method

.method public putIntExtra(Ljava/lang/String;I)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # I

    .prologue
    .line 58
    iget-object v0, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    sget-object v1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    if-ne v0, v1, :cond_0

    .line 59
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    .line 61
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 62
    return-void
.end method

.method public putStringExtra(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    sget-object v1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    if-ne v0, v1, :cond_0

    .line 52
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    .line 54
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/String;

    .prologue
    .line 337
    iput-object p1, p0, Lcom/vkontakte/android/Message;->text:Ljava/lang/String;

    .line 338
    invoke-static {p1}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/Message;->displayableText:Ljava/lang/CharSequence;

    .line 339
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 401
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/vkontakte/android/Message;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/Message;->text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v2, "action"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 11
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 346
    iget-object v8, p0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    invoke-virtual {p1, v8}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 347
    iget-object v8, p0, Lcom/vkontakte/android/Message;->text:Ljava/lang/String;

    invoke-virtual {p1, v8}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 348
    iget-object v8, p0, Lcom/vkontakte/android/Message;->title:Ljava/lang/String;

    invoke-virtual {p1, v8}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 349
    iget-boolean v8, p0, Lcom/vkontakte/android/Message;->out:Z

    if-eqz v8, :cond_0

    move v8, v9

    :goto_0
    invoke-virtual {p1, v8}, Landroid/os/Parcel;->writeInt(I)V

    .line 350
    iget-boolean v8, p0, Lcom/vkontakte/android/Message;->sendFailed:Z

    if-eqz v8, :cond_1

    move v8, v9

    :goto_1
    invoke-virtual {p1, v8}, Landroid/os/Parcel;->writeInt(I)V

    .line 351
    iget-boolean v8, p0, Lcom/vkontakte/android/Message;->readState:Z

    if-eqz v8, :cond_2

    move v8, v9

    :goto_2
    invoke-virtual {p1, v8}, Landroid/os/Parcel;->writeInt(I)V

    .line 352
    iget-boolean v8, p0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    if-eqz v8, :cond_3

    :goto_3
    invoke-virtual {p1, v9}, Landroid/os/Parcel;->writeInt(I)V

    .line 353
    iget v8, p0, Lcom/vkontakte/android/Message;->time:I

    invoke-virtual {p1, v8}, Landroid/os/Parcel;->writeInt(I)V

    .line 354
    iget v8, p0, Lcom/vkontakte/android/Message;->id:I

    invoke-virtual {p1, v8}, Landroid/os/Parcel;->writeInt(I)V

    .line 355
    iget v8, p0, Lcom/vkontakte/android/Message;->sender:I

    invoke-virtual {p1, v8}, Landroid/os/Parcel;->writeInt(I)V

    .line 356
    iget v8, p0, Lcom/vkontakte/android/Message;->peer:I

    invoke-virtual {p1, v8}, Landroid/os/Parcel;->writeInt(I)V

    .line 357
    iget v8, p0, Lcom/vkontakte/android/Message;->randomId:I

    invoke-virtual {p1, v8}, Landroid/os/Parcel;->writeInt(I)V

    .line 359
    iget-object v8, p0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-virtual {p1, v8}, Landroid/os/Parcel;->writeInt(I)V

    .line 360
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_4
    iget-object v8, p0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v4, v8, :cond_4

    .line 361
    iget-object v8, p0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 363
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    :try_start_0
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 364
    .local v6, "os":Ljava/io/ByteArrayOutputStream;
    new-instance v8, Ljava/io/DataOutputStream;

    invoke-direct {v8, v6}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/attachments/Attachment;->serialize(Ljava/io/DataOutputStream;)V

    .line 365
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 366
    .local v1, "b":[B
    array-length v8, v1

    invoke-virtual {p1, v8}, Landroid/os/Parcel;->writeInt(I)V

    .line 367
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByteArray([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 360
    .end local v1    # "b":[B
    .end local v6    # "os":Ljava/io/ByteArrayOutputStream;
    :goto_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v4    # "i":I
    :cond_0
    move v8, v10

    .line 349
    goto :goto_0

    :cond_1
    move v8, v10

    .line 350
    goto :goto_1

    :cond_2
    move v8, v10

    .line 351
    goto :goto_2

    :cond_3
    move v9, v10

    .line 352
    goto :goto_3

    .line 368
    .restart local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .restart local v4    # "i":I
    :catch_0
    move-exception v7

    .line 369
    .local v7, "x":Ljava/lang/Exception;
    new-array v8, v10, [Ljava/lang/Object;

    invoke-static {v7, v8}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_5

    .line 372
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v7    # "x":Ljava/lang/Exception;
    :cond_4
    iget-object v8, p0, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-virtual {p1, v8}, Landroid/os/Parcel;->writeInt(I)V

    .line 375
    const/4 v4, 0x0

    :goto_6
    :try_start_1
    iget-object v8, p0, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v4, v8, :cond_5

    .line 376
    iget-object v8, p0, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/Message$FwdMessage;

    .line 377
    .local v5, "m":Lcom/vkontakte/android/Message$FwdMessage;
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 378
    .local v3, "buf":Ljava/io/ByteArrayOutputStream;
    new-instance v6, Ljava/io/DataOutputStream;

    invoke-direct {v6, v3}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 379
    .local v6, "os":Ljava/io/DataOutputStream;
    invoke-virtual {v5, v6}, Lcom/vkontakte/android/Message$FwdMessage;->serialize(Ljava/io/DataOutputStream;)V

    .line 380
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    .line 381
    .local v2, "bb":[B
    array-length v8, v2

    invoke-virtual {p1, v8}, Landroid/os/Parcel;->writeInt(I)V

    .line 382
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeByteArray([B)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 375
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    .line 384
    .end local v2    # "bb":[B
    .end local v3    # "buf":Ljava/io/ByteArrayOutputStream;
    .end local v5    # "m":Lcom/vkontakte/android/Message$FwdMessage;
    .end local v6    # "os":Ljava/io/DataOutputStream;
    :catch_1
    move-exception v7

    .line 385
    .restart local v7    # "x":Ljava/lang/Exception;
    new-array v8, v10, [Ljava/lang/Object;

    invoke-static {v7, v8}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 388
    .end local v7    # "x":Ljava/lang/Exception;
    :cond_5
    return-void
.end method
