.class public Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "AudioPlaylistAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/attachments/ImageAttachment;


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final playlist:Lcom/vk/music/dto/Playlist;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    new-instance v0, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vk/music/dto/Playlist;)V
    .locals 0
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;->playlist:Lcom/vk/music/dto/Playlist;

    .line 24
    return-void
.end method


# virtual methods
.method public bind(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 84
    const v1, 0x7f1001e4

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/music/view/ThumbsImageView;

    .line 85
    .local v0, "imageView":Lcom/vk/music/view/ThumbsImageView;
    iget-object v1, p0, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;->playlist:Lcom/vk/music/dto/Playlist;

    iget-object v1, v1, Lcom/vk/music/dto/Playlist;->photo:Lcom/vk/music/dto/Thumb;

    if-eqz v1, :cond_0

    .line 86
    iget-object v1, p0, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;->playlist:Lcom/vk/music/dto/Playlist;

    iget-object v1, v1, Lcom/vk/music/dto/Playlist;->photo:Lcom/vk/music/dto/Thumb;

    invoke-virtual {v0, v1}, Lcom/vk/music/view/ThumbsImageView;->setThumb(Lcom/vk/music/dto/Thumb;)V

    .line 90
    :goto_0
    return-void

    .line 88
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;->playlist:Lcom/vk/music/dto/Playlist;

    iget-object v1, v1, Lcom/vk/music/dto/Playlist;->thumbs:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/vk/music/view/ThumbsImageView;->setThumbs(Ljava/util/List;)V

    goto :goto_0
.end method

.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getImageURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    const/4 v0, 0x0

    return-object v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    const/high16 v8, 0x40000000    # 2.0f

    .line 51
    const v6, 0x7f010013

    invoke-static {p1, v6}, Lcom/vkontakte/android/ViewUtils;->getBoolFromTheme(Landroid/content/Context;I)Z

    move-result v2

    .line 52
    .local v2, "isMessagesSnippet":Z
    if-nez p2, :cond_1

    if-eqz v2, :cond_0

    const v6, 0x7f030045

    :goto_0
    const/4 v7, 0x0

    invoke-static {p1, v6, v7}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    .line 55
    .local v5, "v":Landroid/view/View;
    :goto_1
    new-instance v4, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    invoke-direct {v4}, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;-><init>()V

    .line 56
    .local v4, "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    const/4 v6, -0x1

    iput v6, v4, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    .line 57
    const/4 v6, -0x2

    iput v6, v4, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->height:I

    .line 58
    iput-boolean v10, v4, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->center:Z

    .line 59
    invoke-virtual {v5, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 61
    const v6, 0x7f1001e7

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 63
    .local v0, "button":Landroid/widget/TextView;
    const v6, 0x7f1001e4

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/music/view/ThumbsImageView;

    .line 64
    .local v1, "imageView":Lcom/vk/music/view/ThumbsImageView;
    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v7

    invoke-virtual {v1, v6, v9, v7, v9}, Lcom/vk/music/view/ThumbsImageView;->setCornerRadius(IIII)V

    .line 66
    const v6, 0x7f1001dc

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iget-object v7, p0, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;->playlist:Lcom/vk/music/dto/Playlist;

    iget-object v7, v7, Lcom/vk/music/dto/Playlist;->title:Ljava/lang/String;

    invoke-static {v6, v7}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;)V

    .line 67
    const v6, 0x7f1001dd

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iget-object v7, p0, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;->playlist:Lcom/vk/music/dto/Playlist;

    iget-object v7, v7, Lcom/vk/music/dto/Playlist;->description:Ljava/lang/String;

    invoke-static {v6, v7, v10}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;Z)V

    .line 68
    const v6, 0x7f1001e6

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    const v7, 0x7f080400

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;)V

    .line 69
    const v6, 0x7f08047e

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v0, v6}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;)V

    .line 71
    invoke-static {p0, v5}, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;Landroid/view/View;)Landroid/view/View$OnClickListener;

    move-result-object v3

    .line 72
    .local v3, "l":Landroid/view/View$OnClickListener;
    invoke-virtual {v5, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 73
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    return-object v5

    .line 52
    .end local v0    # "button":Landroid/widget/TextView;
    .end local v1    # "imageView":Lcom/vk/music/view/ThumbsImageView;
    .end local v3    # "l":Landroid/view/View$OnClickListener;
    .end local v4    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .end local v5    # "v":Landroid/view/View;
    :cond_0
    const v6, 0x7f030044

    goto :goto_0

    :cond_1
    move-object v5, p2

    goto :goto_1
.end method

.method synthetic lambda$getViewForList$0(Landroid/view/View;Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "v1"    # Landroid/view/View;

    .prologue
    .line 71
    new-instance v0, Lcom/vk/music/fragment/PlaylistFragment$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-direct {v0, v1}, Lcom/vk/music/fragment/PlaylistFragment$Builder;-><init>(Lcom/vk/music/dto/Playlist;)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/fragment/PlaylistFragment$Builder;->go(Landroid/content/Context;)Z

    return-void
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 29
    return-void
.end method
