.class public Lcom/vkontakte/android/NewsEntry$Activity;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "NewsEntry.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/NewsEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Activity"
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/NewsEntry$Activity;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE_COMMENT:I = 0x1

.field public static final TYPE_LIKES:I


# instance fields
.field public commentDate:J

.field public commentFromID:I

.field public commentID:I

.field public commentText:Ljava/lang/String;

.field public likesText:Ljava/lang/String;

.field public photos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public type:I

.field public users:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1739
    new-instance v0, Lcom/vkontakte/android/NewsEntry$Activity$1;

    invoke-direct {v0}, Lcom/vkontakte/android/NewsEntry$Activity$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/NewsEntry$Activity;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 1696
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 1703
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry$Activity;->users:Ljava/util/ArrayList;

    .line 1704
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/NewsEntry$Activity;->photos:Ljava/util/ArrayList;

    return-void
.end method

.method public static deserialize(Ljava/io/DataInputStream;)Lcom/vkontakte/android/NewsEntry$Activity;
    .locals 2
    .param p0, "is"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1716
    invoke-static {p0}, Lcom/vkontakte/android/utils/Serializer;->get(Ljava/io/DataInput;)Lcom/vkontakte/android/utils/Serializer;

    move-result-object v0

    const-class v1, Lcom/vkontakte/android/NewsEntry$Activity;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsEntry$Activity;

    return-object v0
.end method

.method public static getType(Ljava/lang/String;)I
    .locals 4
    .param p0, "type"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 1770
    const/4 v2, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 1776
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Illegal activity type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1770
    :sswitch_0
    const-string/jumbo v3, "likes"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move v2, v0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v3, "comment"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move v2, v1

    goto :goto_0

    :pswitch_0
    move v0, v1

    .line 1774
    :pswitch_1
    return v0

    .line 1770
    nop

    :sswitch_data_0
    .sparse-switch
        0x62343bc -> :sswitch_0
        0x38a5ee5f -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static parse(Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;)Lcom/vkontakte/android/NewsEntry$Activity;
    .locals 10
    .param p0, "json"    # Lorg/json/JSONObject;
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
            ">;)",
            "Lcom/vkontakte/android/NewsEntry$Activity;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .local p1, "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .local p2, "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 1782
    new-instance v0, Lcom/vkontakte/android/NewsEntry$Activity;

    invoke-direct {v0}, Lcom/vkontakte/android/NewsEntry$Activity;-><init>()V

    .line 1783
    .local v0, "activity":Lcom/vkontakte/android/NewsEntry$Activity;
    const-string/jumbo v6, "type"

    invoke-virtual {p0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1784
    .local v3, "type":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 1785
    .local v1, "data":Lorg/json/JSONObject;
    const/4 v6, -0x1

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v9

    sparse-switch v9, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v6, :pswitch_data_0

    .line 1805
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "illegal activity type: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1785
    :sswitch_0
    const-string/jumbo v9, "likes"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    move v6, v7

    goto :goto_0

    :sswitch_1
    const-string/jumbo v9, "comment"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    move v6, v8

    goto :goto_0

    .line 1787
    :pswitch_0
    iput v7, v0, Lcom/vkontakte/android/NewsEntry$Activity;->type:I

    .line 1788
    const-string/jumbo v6, "text"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v0, Lcom/vkontakte/android/NewsEntry$Activity;->likesText:Ljava/lang/String;

    .line 1789
    const-string/jumbo v6, "user_ids"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 1790
    .local v4, "userIDs":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v2, v6, :cond_1

    .line 1791
    iget-object v6, v0, Lcom/vkontakte/android/NewsEntry$Activity;->photos:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Lorg/json/JSONArray;->getInt(I)I

    move-result v7

    invoke-virtual {p2, v7}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1790
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1795
    .end local v2    # "i":I
    .end local v4    # "userIDs":Lorg/json/JSONArray;
    :pswitch_1
    iput v8, v0, Lcom/vkontakte/android/NewsEntry$Activity;->type:I

    .line 1796
    const-string/jumbo v6, "from_id"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    .line 1797
    .local v5, "userId":I
    iput v5, v0, Lcom/vkontakte/android/NewsEntry$Activity;->commentFromID:I

    .line 1798
    iget-object v6, v0, Lcom/vkontakte/android/NewsEntry$Activity;->users:Ljava/util/ArrayList;

    invoke-virtual {p1, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1799
    iget-object v6, v0, Lcom/vkontakte/android/NewsEntry$Activity;->photos:Ljava/util/ArrayList;

    invoke-virtual {p2, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1800
    const-string/jumbo v6, "id"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    iput v6, v0, Lcom/vkontakte/android/NewsEntry$Activity;->commentID:I

    .line 1801
    const-string/jumbo v6, "date"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v6

    iput-wide v6, v0, Lcom/vkontakte/android/NewsEntry$Activity;->commentDate:J

    .line 1802
    const-string/jumbo v6, "text"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v0, Lcom/vkontakte/android/NewsEntry$Activity;->commentText:Ljava/lang/String;

    .line 1803
    .end local v5    # "userId":I
    :cond_1
    return-object v0

    .line 1785
    nop

    :sswitch_data_0
    .sparse-switch
        0x62343bc -> :sswitch_0
        0x38a5ee5f -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public final serialize(Ljava/io/DataOutputStream;)V
    .locals 1
    .param p1, "os"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1712
    invoke-static {p1}, Lcom/vkontakte/android/utils/Serializer;->get(Ljava/io/DataOutput;)Lcom/vkontakte/android/utils/Serializer;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 1713
    return-void
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 4
    .param p1, "os"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 1721
    iget v1, p0, Lcom/vkontakte/android/NewsEntry$Activity;->type:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1723
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry$Activity;->likesText:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 1724
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry$Activity;->users:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1725
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry$Activity;->users:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1726
    .local v0, "s":Ljava/lang/String;
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    goto :goto_0

    .line 1728
    .end local v0    # "s":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry$Activity;->photos:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1729
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry$Activity;->photos:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1730
    .restart local v0    # "s":Ljava/lang/String;
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    goto :goto_1

    .line 1733
    .end local v0    # "s":Ljava/lang/String;
    :cond_1
    iget v1, p0, Lcom/vkontakte/android/NewsEntry$Activity;->commentID:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1734
    iget v1, p0, Lcom/vkontakte/android/NewsEntry$Activity;->commentFromID:I

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 1735
    iget-wide v2, p0, Lcom/vkontakte/android/NewsEntry$Activity;->commentDate:J

    invoke-virtual {p1, v2, v3}, Lcom/vkontakte/android/utils/Serializer;->writeLong(J)V

    .line 1736
    iget-object v1, p0, Lcom/vkontakte/android/NewsEntry$Activity;->commentText:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 1737
    return-void
.end method
