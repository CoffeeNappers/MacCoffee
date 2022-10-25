.class public Lcom/vkontakte/android/attachments/PrettyCardAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "PrettyCardAttachment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/attachments/PrettyCardAttachment$PrettyCardDecoration;,
        Lcom/vkontakte/android/attachments/PrettyCardAttachment$ViewHolder;,
        Lcom/vkontakte/android/attachments/PrettyCardAttachment$Adapter;,
        Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;,
        Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/PrettyCardAttachment;",
            ">;"
        }
    .end annotation
.end field

.field public static final REUSE_VIEW_TYPE:Ljava/lang/String; = "pretty_cards"


# instance fields
.field private cards:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 102
    new-instance v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "is"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 59
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 60
    sget-object v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment;->cards:Ljava/util/List;

    .line 61
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 5
    .param p1, "json"    # Lorg/json/JSONObject;

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 42
    const-string/jumbo v2, "cards"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 43
    .local v0, "cardsJson":Lorg/json/JSONArray;
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment;->cards:Ljava/util/List;

    .line 45
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 46
    iget-object v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment;->cards:Ljava/util/List;

    new-instance v3, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;-><init>(Lorg/json/JSONObject;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 48
    :cond_0
    return-void
.end method


# virtual methods
.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 65
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/attachments/PrettyCardAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    .line 70
    const-string/jumbo v2, "pretty_cards"

    invoke-static {p1, v2}, Lcom/vkontakte/android/attachments/PrettyCardAttachment;->getReusableView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView;

    .line 72
    .local v1, "recyclerView":Landroid/support/v7/widget/RecyclerView;
    if-nez v1, :cond_1

    .line 73
    const/4 v1, 0x0

    .line 88
    .end local v1    # "recyclerView":Landroid/support/v7/widget/RecyclerView;
    :cond_0
    :goto_0
    return-object v1

    .line 76
    .restart local v1    # "recyclerView":Landroid/support/v7/widget/RecyclerView;
    :cond_1
    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v2

    if-nez v2, :cond_2

    .line 77
    new-instance v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Adapter;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment;->cards:Ljava/util/List;

    invoke-direct {v0, v2}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Adapter;-><init>(Ljava/util/List;)V

    .line 78
    .local v0, "adapter":Lcom/vkontakte/android/attachments/PrettyCardAttachment$Adapter;
    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    goto :goto_0

    .line 80
    .end local v0    # "adapter":Lcom/vkontakte/android/attachments/PrettyCardAttachment$Adapter;
    :cond_2
    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Adapter;

    .line 82
    .restart local v0    # "adapter":Lcom/vkontakte/android/attachments/PrettyCardAttachment$Adapter;
    iget-object v2, v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Adapter;->cards:Ljava/util/List;

    iget-object v3, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment;->cards:Ljava/util/List;

    if-eq v2, v3, :cond_0

    .line 83
    iget-object v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment;->cards:Ljava/util/List;

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Adapter;->setItems(Ljava/util/List;)V

    .line 84
    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->scrollToPosition(I)V

    goto :goto_0
.end method

.method public overrideLayoutParams()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .locals 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 53
    new-instance v0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    invoke-direct {v0}, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;-><init>()V

    .line 54
    .local v0, "layoutParams":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->center:Z

    .line 56
    return-object v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 99
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment;->cards:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 100
    return-void
.end method

.method public setStatisticsData(Lcom/vkontakte/android/data/PostInteract;II)V
    .locals 3
    .param p1, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "adId1"    # I
    .param p3, "adId2"    # I

    .prologue
    .line 92
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment;->cards:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    .line 93
    .local v0, "card":Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;
    invoke-virtual {v0, p1, p2, p3}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->setStatisticsData(Lcom/vkontakte/android/data/PostInteract;II)V

    goto :goto_0

    .line 95
    .end local v0    # "card":Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;
    :cond_0
    return-void
.end method
