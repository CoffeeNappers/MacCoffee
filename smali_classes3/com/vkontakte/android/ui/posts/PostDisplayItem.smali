.class public abstract Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.super Ljava/lang/Object;
.source "PostDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/posts/PostDisplayItem$OnBindView;
    }
.end annotation


# static fields
.field public static final TYPE_ACTIVITY_COMMENT:I = 0x13

.field public static final TYPE_ACTIVITY_LIKES:I = 0x12

.field public static final TYPE_AD_GOODS_BLOCK:I = 0xf

.field public static final TYPE_ATTACH_CONTAINER:I = 0x9

.field public static final TYPE_AUDIO_ATTACH:I = 0x6

.field public static final TYPE_BUTTONS:I = 0xa

.field public static final TYPE_COMMENT:I = 0x4

.field public static final TYPE_COMMON_ATTACH:I = 0x7

.field public static final TYPE_FOOTER:I = 0x1

.field public static final TYPE_FRIENDS_RECOMM:I = 0xd

.field public static final TYPE_HEADER:I = 0x0

.field public static final TYPE_HEADER_AD:I = 0xc

.field public static final TYPE_HEADER_RECOMMENDED:I = 0x14

.field public static final TYPE_MARKED_AS_ADS:I = 0x15

.field public static final TYPE_PADDING:I = 0x11

.field public static final TYPE_REPOST:I = 0x3

.field public static final TYPE_SHIT_BLOCK:I = 0xe

.field public static final TYPE_SIGNATURE:I = 0x8

.field public static final TYPE_TAG_CONFIRMATION:I = 0x10

.field public static final TYPE_TEXT:I = 0x2

.field public static final TYPE_THUMBS_BLOCK:I = 0x5

.field public static final TYPE_WIDGET:I = 0x16

.field public static final VIEW_TYPE_COUNT:I = 0x17


# instance fields
.field public bgType:I

.field public clickable:Z

.field private onBindView:Lcom/vkontakte/android/ui/posts/PostDisplayItem$OnBindView;

.field public postID:I

.field public postOwnerID:I

.field public trackCode:Ljava/lang/String;


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .param p1, "_postID"    # I
    .param p2, "_postOwnerID"    # I

    .prologue
    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->clickable:Z

    .line 103
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->onBindView:Lcom/vkontakte/android/ui/posts/PostDisplayItem$OnBindView;

    .line 106
    iput p1, p0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postID:I

    .line 107
    iput p2, p0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postOwnerID:I

    .line 108
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;)V
    .locals 1
    .param p1, "entry"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->clickable:Z

    .line 103
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->onBindView:Lcom/vkontakte/android/ui/posts/PostDisplayItem$OnBindView;

    .line 111
    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->postID:I

    iput v0, p0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postID:I

    .line 112
    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iput v0, p0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postOwnerID:I

    .line 113
    invoke-virtual {p1}, Lcom/vkontakte/android/NewsEntry;->getTrackCode()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->trackCode:Ljava/lang/String;

    .line 114
    return-void
.end method


# virtual methods
.method public final bindView(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 127
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->onBindView(Landroid/view/View;)V

    .line 129
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->onBindView:Lcom/vkontakte/android/ui/posts/PostDisplayItem$OnBindView;

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->onBindView:Lcom/vkontakte/android/ui/posts/PostDisplayItem$OnBindView;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem$OnBindView;->onBindView(Landroid/view/View;)V

    .line 132
    :cond_0
    return-void
.end method

.method public getAutoPlayItem()Lcom/vkontakte/android/media/AutoPlay;
    .locals 1

    .prologue
    .line 121
    const/4 v0, 0x0

    return-object v0
.end method

.method public abstract getImageCount()I
.end method

.method public abstract getImageURL(I)Ljava/lang/String;
.end method

.method public abstract getType()I
.end method

.method public abstract onBindView(Landroid/view/View;)V
.end method

.method public setOnBindView(Lcom/vkontakte/android/ui/posts/PostDisplayItem$OnBindView;)V
    .locals 0
    .param p1, "onBindView"    # Lcom/vkontakte/android/ui/posts/PostDisplayItem$OnBindView;

    .prologue
    .line 117
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->onBindView:Lcom/vkontakte/android/ui/posts/PostDisplayItem$OnBindView;

    .line 118
    return-void
.end method
