.class public abstract Lcom/vkontakte/android/utils/Serializer;
.super Ljava/lang/Object;
.source "Serializer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/utils/Serializer$DataInputSerializer;,
        Lcom/vkontakte/android/utils/Serializer$DataOutputSerializer;,
        Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;,
        Lcom/vkontakte/android/utils/Serializer$BadSerializableException;,
        Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;,
        Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;,
        Lcom/vkontakte/android/utils/Serializer$Creator;,
        Lcom/vkontakte/android/utils/Serializer$Serializable;
    }
.end annotation


# static fields
.field private static final mCreators:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/ClassLoader;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<*>;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 283
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/vkontakte/android/utils/Serializer;->mCreators:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/os/Bundle;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Landroid/os/Bundle;

    .prologue
    .line 29
    invoke-static {p0}, Lcom/vkontakte/android/utils/Serializer;->serializeExtras(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Ljava/io/Serializable;)[B
    .locals 1
    .param p0, "x0"    # Ljava/io/Serializable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 29
    invoke-static {p0}, Lcom/vkontakte/android/utils/Serializer;->serializeJavaSerializable(Ljava/io/Serializable;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Ljava/lang/String;)Landroid/os/Bundle;
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-static {p0}, Lcom/vkontakte/android/utils/Serializer;->deserializeExtras(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300([B)Ljava/io/Serializable;
    .locals 1
    .param p0, "x0"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 29
    invoke-static {p0}, Lcom/vkontakte/android/utils/Serializer;->deserializeJavaSerializable([B)Ljava/io/Serializable;

    move-result-object v0

    return-object v0
.end method

.method private static deserializeExtras(Ljava/lang/String;)Landroid/os/Bundle;
    .locals 7
    .param p0, "extraStr"    # Ljava/lang/String;

    .prologue
    .line 806
    if-nez p0, :cond_1

    .line 807
    const/4 v0, 0x0

    .line 831
    :cond_0
    :goto_0
    return-object v0

    .line 809
    :cond_1
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 810
    .local v0, "extra":Landroid/os/Bundle;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_0

    .line 812
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 813
    .local v4, "obj":Lorg/json/JSONObject;
    invoke-virtual {v4}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    .line 814
    .local v2, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 815
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 816
    .local v1, "k":Ljava/lang/String;
    invoke-virtual {v4, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 817
    .local v3, "o":Ljava/lang/Object;
    instance-of v6, v3, Ljava/lang/Integer;

    if-eqz v6, :cond_2

    .line 818
    check-cast v3, Ljava/lang/Integer;

    .end local v3    # "o":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v0, v1, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 827
    .end local v1    # "k":Ljava/lang/String;
    .end local v2    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v4    # "obj":Lorg/json/JSONObject;
    :catch_0
    move-exception v5

    .line 828
    .local v5, "x":Lorg/json/JSONException;
    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v5, v6}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 819
    .end local v5    # "x":Lorg/json/JSONException;
    .restart local v1    # "k":Ljava/lang/String;
    .restart local v2    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .restart local v3    # "o":Ljava/lang/Object;
    .restart local v4    # "obj":Lorg/json/JSONObject;
    :cond_2
    :try_start_1
    instance-of v6, v3, Ljava/lang/Boolean;

    if-eqz v6, :cond_3

    .line 820
    check-cast v3, Ljava/lang/Boolean;

    .end local v3    # "o":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-virtual {v0, v1, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_1

    .line 821
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_3
    instance-of v6, v3, Lorg/json/JSONObject;

    if-eqz v6, :cond_4

    .line 822
    check-cast v3, Lorg/json/JSONObject;

    .end local v3    # "o":Ljava/lang/Object;
    invoke-static {v3}, Lcom/vkontakte/android/utils/JSONSerializable$Factory;->from(Lorg/json/JSONObject;)Lcom/vkontakte/android/utils/JSONSerializable;

    move-result-object v6

    invoke-virtual {v0, v1, v6}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    goto :goto_1

    .line 824
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_4
    check-cast v3, Ljava/lang/String;

    .end local v3    # "o":Ljava/lang/Object;
    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private static deserializeJavaSerializable([B)Ljava/io/Serializable;
    .locals 2
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 774
    new-instance v0, Ljava/io/ObjectInputStream;

    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v0, v1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/Serializable;

    return-object v0
.end method

.method public static get(Landroid/os/Parcel;)Lcom/vkontakte/android/utils/Serializer;
    .locals 1
    .param p0, "parcel"    # Landroid/os/Parcel;

    .prologue
    .line 346
    new-instance v0, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/utils/Serializer$ParcelSerializer;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public static get(Ljava/io/DataInput;)Lcom/vkontakte/android/utils/Serializer;
    .locals 1
    .param p0, "dataInput"    # Ljava/io/DataInput;

    .prologue
    .line 354
    new-instance v0, Lcom/vkontakte/android/utils/Serializer$DataInputSerializer;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/utils/Serializer$DataInputSerializer;-><init>(Ljava/io/DataInput;)V

    return-object v0
.end method

.method public static get(Ljava/io/DataOutput;)Lcom/vkontakte/android/utils/Serializer;
    .locals 1
    .param p0, "dataOutput"    # Ljava/io/DataOutput;

    .prologue
    .line 350
    new-instance v0, Lcom/vkontakte/android/utils/Serializer$DataOutputSerializer;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/utils/Serializer$DataOutputSerializer;-><init>(Ljava/io/DataOutput;)V

    return-object v0
.end method

.method private readSerializerCreator(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Creator;
    .locals 13
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ClassLoader;",
            ")",
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<*>;"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 286
    invoke-virtual {p0}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v5

    .line 287
    .local v5, "name":Ljava/lang/String;
    if-nez v5, :cond_0

    .line 340
    :goto_0
    return-object v0

    .line 291
    :cond_0
    sget-object v9, Lcom/vkontakte/android/utils/Serializer;->mCreators:Ljava/util/HashMap;

    monitor-enter v9

    .line 292
    :try_start_0
    sget-object v8, Lcom/vkontakte/android/utils/Serializer;->mCreators:Ljava/util/HashMap;

    invoke-virtual {v8, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    .line 293
    .local v4, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/vkontakte/android/utils/Serializer$Creator<*>;>;"
    if-nez v4, :cond_1

    .line 294
    new-instance v4, Ljava/util/HashMap;

    .end local v4    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/vkontakte/android/utils/Serializer$Creator<*>;>;"
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 295
    .restart local v4    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/vkontakte/android/utils/Serializer$Creator<*>;>;"
    sget-object v8, Lcom/vkontakte/android/utils/Serializer;->mCreators:Ljava/util/HashMap;

    invoke-virtual {v8, p1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    :cond_1
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/utils/Serializer$Creator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 299
    .local v0, "creator":Lcom/vkontakte/android/utils/Serializer$Creator;, "Lcom/vkontakte/android/utils/Serializer$Creator<*>;"
    if-nez v0, :cond_7

    .line 302
    if-nez p1, :cond_2

    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    .line 303
    .local v7, "serializableClassLoader":Ljava/lang/ClassLoader;
    :goto_1
    const/4 v8, 0x0

    invoke-static {v5, v8, v7}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v6

    .line 304
    .local v6, "serializableClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v8, Lcom/vkontakte/android/utils/Serializer$Serializable;

    invoke-virtual {v8, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 305
    new-instance v8, Lcom/vkontakte/android/utils/Serializer$BadSerializableException;

    const-string/jumbo v10, "Serializer.Serializable protocol requires that the class implements Serializer.Serializable"

    invoke-direct {v8, v10}, Lcom/vkontakte/android/utils/Serializer$BadSerializableException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 320
    .end local v0    # "creator":Lcom/vkontakte/android/utils/Serializer$Creator;, "Lcom/vkontakte/android/utils/Serializer$Creator<*>;"
    .end local v6    # "serializableClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "serializableClassLoader":Ljava/lang/ClassLoader;
    :catch_0
    move-exception v2

    .line 321
    .local v2, "e":Ljava/lang/IllegalAccessException;
    const/4 v8, 0x2

    :try_start_2
    new-array v8, v8, [Ljava/lang/Object;

    const/4 v10, 0x0

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Illegal access when unmarshalling: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v8, v10

    const/4 v10, 0x1

    aput-object v2, v8, v10

    invoke-static {v8}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 322
    new-instance v8, Lcom/vkontakte/android/utils/Serializer$BadSerializableException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "IllegalAccessException when unmarshalling: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v10}, Lcom/vkontakte/android/utils/Serializer$BadSerializableException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 339
    .end local v2    # "e":Ljava/lang/IllegalAccessException;
    .end local v4    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/vkontakte/android/utils/Serializer$Creator<*>;>;"
    :catchall_0
    move-exception v8

    monitor-exit v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v8

    .restart local v0    # "creator":Lcom/vkontakte/android/utils/Serializer$Creator;, "Lcom/vkontakte/android/utils/Serializer$Creator<*>;"
    .restart local v4    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/vkontakte/android/utils/Serializer$Creator<*>;>;"
    :cond_2
    move-object v7, p1

    .line 302
    goto :goto_1

    .line 308
    .restart local v6    # "serializableClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v7    # "serializableClassLoader":Ljava/lang/ClassLoader;
    :cond_3
    :try_start_3
    const-string/jumbo v8, "CREATOR"

    invoke-virtual {v6, v8}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 309
    .local v3, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v8

    and-int/lit8 v8, v8, 0x8

    if-nez v8, :cond_4

    .line 310
    new-instance v8, Lcom/vkontakte/android/utils/Serializer$BadSerializableException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Serializer.Serializable protocol requires the CREATOR object to be static on class "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v10}, Lcom/vkontakte/android/utils/Serializer$BadSerializableException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 323
    .end local v0    # "creator":Lcom/vkontakte/android/utils/Serializer$Creator;, "Lcom/vkontakte/android/utils/Serializer$Creator<*>;"
    .end local v3    # "f":Ljava/lang/reflect/Field;
    .end local v6    # "serializableClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "serializableClassLoader":Ljava/lang/ClassLoader;
    :catch_1
    move-exception v2

    .line 324
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    const/4 v8, 0x2

    :try_start_4
    new-array v8, v8, [Ljava/lang/Object;

    const/4 v10, 0x0

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Class not found when unmarshalling: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v8, v10

    const/4 v10, 0x1

    aput-object v2, v8, v10

    invoke-static {v8}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 325
    new-instance v8, Lcom/vkontakte/android/utils/Serializer$BadSerializableException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "ClassNotFoundException when unmarshalling: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v10}, Lcom/vkontakte/android/utils/Serializer$BadSerializableException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 313
    .end local v2    # "e":Ljava/lang/ClassNotFoundException;
    .restart local v0    # "creator":Lcom/vkontakte/android/utils/Serializer$Creator;, "Lcom/vkontakte/android/utils/Serializer$Creator<*>;"
    .restart local v3    # "f":Ljava/lang/reflect/Field;
    .restart local v6    # "serializableClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v7    # "serializableClassLoader":Ljava/lang/ClassLoader;
    :cond_4
    :try_start_5
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    .line 314
    .local v1, "creatorType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v8, Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {v8, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-nez v8, :cond_5

    .line 315
    new-instance v8, Lcom/vkontakte/android/utils/Serializer$BadSerializableException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Serializer.Serializable protocol requires a Serializer.Creator object called CREATOR on class "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v10}, Lcom/vkontakte/android/utils/Serializer$BadSerializableException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_5
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 326
    .end local v0    # "creator":Lcom/vkontakte/android/utils/Serializer$Creator;, "Lcom/vkontakte/android/utils/Serializer$Creator<*>;"
    .end local v1    # "creatorType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "f":Ljava/lang/reflect/Field;
    .end local v6    # "serializableClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "serializableClassLoader":Ljava/lang/ClassLoader;
    :catch_2
    move-exception v2

    .line 327
    .local v2, "e":Ljava/lang/NoSuchFieldException;
    :try_start_6
    new-instance v8, Lcom/vkontakte/android/utils/Serializer$BadSerializableException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Serializer.Serializable protocol requires a Serializer.Creator object called CREATOR on class "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v10}, Lcom/vkontakte/android/utils/Serializer$BadSerializableException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 319
    .end local v2    # "e":Ljava/lang/NoSuchFieldException;
    .restart local v0    # "creator":Lcom/vkontakte/android/utils/Serializer$Creator;, "Lcom/vkontakte/android/utils/Serializer$Creator<*>;"
    .restart local v1    # "creatorType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v3    # "f":Ljava/lang/reflect/Field;
    .restart local v6    # "serializableClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v7    # "serializableClassLoader":Ljava/lang/ClassLoader;
    :cond_5
    const/4 v8, 0x0

    :try_start_7
    invoke-virtual {v3, v8}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "creator":Lcom/vkontakte/android/utils/Serializer$Creator;, "Lcom/vkontakte/android/utils/Serializer$Creator<*>;"
    check-cast v0, Lcom/vkontakte/android/utils/Serializer$Creator;
    :try_end_7
    .catch Ljava/lang/IllegalAccessException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 331
    .restart local v0    # "creator":Lcom/vkontakte/android/utils/Serializer$Creator;, "Lcom/vkontakte/android/utils/Serializer$Creator<*>;"
    if-nez v0, :cond_6

    .line 332
    :try_start_8
    new-instance v8, Lcom/vkontakte/android/utils/Serializer$BadSerializableException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Serializer.Serializable protocol requires a non-null Serializer.Creator object called CREATOR on class "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v10}, Lcom/vkontakte/android/utils/Serializer$BadSerializableException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 337
    :cond_6
    invoke-virtual {v4, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    .end local v1    # "creatorType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "f":Ljava/lang/reflect/Field;
    .end local v6    # "serializableClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v7    # "serializableClassLoader":Ljava/lang/ClassLoader;
    :cond_7
    monitor-exit v9
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto/16 :goto_0
.end method

.method private static serializeExtras(Landroid/os/Bundle;)Ljava/lang/String;
    .locals 7
    .param p0, "extra"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 781
    if-nez p0, :cond_0

    .line 782
    const/4 v5, 0x0

    .line 802
    :goto_0
    return-object v5

    .line 784
    :cond_0
    invoke-virtual {p0}, Landroid/os/Bundle;->size()I

    move-result v5

    if-nez v5, :cond_1

    .line 785
    const-string/jumbo v5, ""

    goto :goto_0

    .line 788
    :cond_1
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 789
    .local v3, "obj":Lorg/json/JSONObject;
    invoke-virtual {p0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 790
    .local v1, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 791
    .local v0, "k":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 792
    .local v2, "o":Ljava/lang/Object;
    instance-of v6, v2, Lcom/vkontakte/android/utils/JSONSerializable;

    if-eqz v6, :cond_2

    .line 793
    check-cast v2, Lcom/vkontakte/android/utils/JSONSerializable;

    .end local v2    # "o":Ljava/lang/Object;
    invoke-static {v2}, Lcom/vkontakte/android/utils/JSONSerializable$Factory;->to(Lcom/vkontakte/android/utils/JSONSerializable;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v3, v0, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 799
    .end local v0    # "k":Ljava/lang/String;
    .end local v1    # "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v3    # "obj":Lorg/json/JSONObject;
    :catch_0
    move-exception v4

    .line 800
    .local v4, "x":Lorg/json/JSONException;
    const-string/jumbo v5, "vk"

    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 802
    const-string/jumbo v5, ""

    goto :goto_0

    .line 795
    .end local v4    # "x":Lorg/json/JSONException;
    .restart local v0    # "k":Ljava/lang/String;
    .restart local v1    # "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v2    # "o":Ljava/lang/Object;
    .restart local v3    # "obj":Lorg/json/JSONObject;
    :cond_2
    :try_start_1
    invoke-virtual {v3, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    .line 798
    .end local v0    # "k":Ljava/lang/String;
    .end local v2    # "o":Ljava/lang/Object;
    :cond_3
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v5

    goto :goto_0
.end method

.method private static serializeJavaSerializable(Ljava/io/Serializable;)[B
    .locals 2
    .param p0, "obj"    # Ljava/io/Serializable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 768
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 769
    .local v0, "out":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Ljava/io/ObjectOutputStream;

    invoke-direct {v1, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {v1, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 770
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public createByteArray()[B
    .locals 4
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 230
    invoke-virtual {p0}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v2

    .line 231
    .local v2, "length":I
    if-gez v2, :cond_1

    .line 232
    const/4 v0, 0x0

    .line 238
    :cond_0
    return-object v0

    .line 234
    :cond_1
    new-array v0, v2, [B

    .line 235
    .local v0, "bytes":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 236
    invoke-virtual {p0}, Lcom/vkontakte/android/utils/Serializer;->readByte()B

    move-result v3

    aput-byte v3, v0, v1

    .line 235
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public createStringArray()[Ljava/lang/String;
    .locals 4
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 215
    invoke-virtual {p0}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v1

    .line 216
    .local v1, "length":I
    if-gez v1, :cond_1

    .line 217
    const/4 v2, 0x0

    .line 223
    :cond_0
    return-object v2

    .line 219
    :cond_1
    new-array v2, v1, [Ljava/lang/String;

    .line 220
    .local v2, "strings":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 221
    invoke-virtual {p0}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    .line 220
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public final createTypedArray(Lcom/vkontakte/android/utils/Serializer$Creator;)[Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<TT;>;)[TT;"
        }
    .end annotation

    .prologue
    .line 244
    .local p1, "c":Lcom/vkontakte/android/utils/Serializer$Creator;, "Lcom/vkontakte/android/utils/Serializer$Creator<TT;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    .line 245
    .local v0, "N":I
    if-gez v0, :cond_1

    .line 246
    const/4 v2, 0x0

    .line 254
    :cond_0
    return-object v2

    .line 248
    :cond_1
    invoke-interface {p1, v0}, Lcom/vkontakte/android/utils/Serializer$Creator;->newArray(I)[Ljava/lang/Object;

    move-result-object v2

    .line 249
    .local v2, "l":[Ljava/lang/Object;, "[TT;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 250
    invoke-virtual {p0}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v3

    if-eqz v3, :cond_2

    .line 251
    invoke-interface {p1, p0}, Lcom/vkontakte/android/utils/Serializer$Creator;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v2, v1

    .line 249
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public final createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<TT;>;)",
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .local p1, "c":Lcom/vkontakte/android/utils/Serializer$Creator;, "Lcom/vkontakte/android/utils/Serializer$Creator<TT;>;"
    const/4 v2, 0x0

    .line 259
    invoke-virtual {p0}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    .line 260
    .local v0, "N":I
    if-gez v0, :cond_1

    move-object v1, v2

    .line 272
    :cond_0
    return-object v1

    .line 263
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 264
    .local v1, "l":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    :goto_0
    if-lez v0, :cond_0

    .line 265
    invoke-virtual {p0}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v3

    if-eqz v3, :cond_2

    .line 266
    invoke-interface {p1, p0}, Lcom/vkontakte/android/utils/Serializer$Creator;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 270
    :goto_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 268
    :cond_2
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method public abstract readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract readByte()B
.end method

.method public abstract readChar()C
.end method

.method public abstract readDouble()D
.end method

.method public abstract readFloat()F
.end method

.method public abstract readInt()I
.end method

.method public abstract readJavaSerializable()Ljava/io/Serializable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/io/Serializable;",
            ">()TT;"
        }
    .end annotation
.end method

.method public abstract readLong()J
.end method

.method public final readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;
    .locals 2
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/vkontakte/android/utils/Serializer$Serializable;",
            ">(",
            "Ljava/lang/ClassLoader;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 202
    invoke-direct {p0, p1}, Lcom/vkontakte/android/utils/Serializer;->readSerializerCreator(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Creator;

    move-result-object v0

    .line 203
    .local v0, "creator":Lcom/vkontakte/android/utils/Serializer$Creator;, "Lcom/vkontakte/android/utils/Serializer$Creator<*>;"
    if-nez v0, :cond_0

    .line 204
    const/4 v1, 0x0

    .line 206
    :goto_0
    return-object v1

    :cond_0
    invoke-interface {v0, p0}, Lcom/vkontakte/android/utils/Serializer$Creator;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/utils/Serializer$Serializable;

    goto :goto_0
.end method

.method public abstract readString()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract writeBundle(Landroid/os/Bundle;)V
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract writeByte(B)V
.end method

.method public writeByteArray([B)V
    .locals 3
    .param p1, "v"    # [B
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 122
    if-nez p1, :cond_1

    .line 123
    const/4 v1, -0x1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 130
    :cond_0
    return-void

    .line 125
    :cond_1
    array-length v1, p1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 126
    array-length v2, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_0

    aget-byte v0, p1, v1

    .line 127
    .local v0, "b":B
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/utils/Serializer;->writeByte(B)V

    .line 126
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public abstract writeChar(C)V
.end method

.method public abstract writeDouble(D)V
.end method

.method public abstract writeFloat(F)V
.end method

.method public abstract writeInt(I)V
.end method

.method public abstract writeJavaSerializable(Ljava/io/Serializable;)V
    .param p1    # Ljava/io/Serializable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract writeLong(J)V
.end method

.method public writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V
    .locals 1
    .param p1, "v"    # Lcom/vkontakte/android/utils/Serializer$Serializable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 97
    if-nez p1, :cond_0

    .line 98
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 103
    :goto_0
    return-void

    .line 100
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 101
    invoke-interface {p1, p0}, Lcom/vkontakte/android/utils/Serializer$Serializable;->serializeTo(Lcom/vkontakte/android/utils/Serializer;)V

    goto :goto_0
.end method

.method public abstract writeString(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public writeStringArray([Ljava/lang/String;)V
    .locals 3
    .param p1, "v"    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 110
    if-nez p1, :cond_1

    .line 111
    const/4 v1, -0x1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 118
    :cond_0
    return-void

    .line 113
    :cond_1
    array-length v1, p1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 114
    array-length v2, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v0, p1, v1

    .line 115
    .local v0, "s":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 114
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public final writeTypedArray([Lcom/vkontakte/android/utils/Serializer$Serializable;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/vkontakte/android/utils/Serializer$Serializable;",
            ">([TT;)V"
        }
    .end annotation

    .prologue
    .local p1, "val":[Lcom/vkontakte/android/utils/Serializer$Serializable;, "[TT;"
    const/4 v3, 0x0

    .line 134
    if-eqz p1, :cond_1

    .line 135
    array-length v0, p1

    .line 136
    .local v0, "N":I
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 137
    array-length v4, p1

    move v2, v3

    :goto_0
    if-ge v2, v4, :cond_2

    aget-object v1, p1, v2

    .line 138
    .local v1, "item":Lcom/vkontakte/android/utils/Serializer$Serializable;, "TT;"
    if-eqz v1, :cond_0

    .line 139
    const/4 v5, 0x1

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 140
    invoke-interface {v1, p0}, Lcom/vkontakte/android/utils/Serializer$Serializable;->serializeTo(Lcom/vkontakte/android/utils/Serializer;)V

    .line 137
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 142
    :cond_0
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    goto :goto_1

    .line 146
    .end local v0    # "N":I
    .end local v1    # "item":Lcom/vkontakte/android/utils/Serializer$Serializable;, "TT;"
    :cond_1
    const/4 v2, -0x1

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 148
    :cond_2
    return-void
.end method

.method public final writeTypedList(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/vkontakte/android/utils/Serializer$Serializable;",
            ">(",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 152
    .local p1, "val":Ljava/util/List;, "Ljava/util/List<TT;>;"
    if-nez p1, :cond_1

    .line 153
    const/4 v3, -0x1

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 169
    :cond_0
    return-void

    .line 156
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 157
    .local v0, "N":I
    const/4 v1, 0x0

    .line 158
    .local v1, "i":I
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 159
    :goto_0
    if-ge v1, v0, :cond_0

    .line 160
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/utils/Serializer$Serializable;

    .line 161
    .local v2, "item":Lcom/vkontakte/android/utils/Serializer$Serializable;, "TT;"
    if-eqz v2, :cond_2

    .line 162
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 163
    invoke-interface {v2, p0}, Lcom/vkontakte/android/utils/Serializer$Serializable;->serializeTo(Lcom/vkontakte/android/utils/Serializer;)V

    .line 167
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 168
    goto :goto_0

    .line 165
    :cond_2
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    goto :goto_1
.end method
