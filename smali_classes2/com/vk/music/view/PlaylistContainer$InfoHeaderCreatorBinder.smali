.class final Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;
.super Ljava/lang/Object;
.source "PlaylistContainer.java"

# interfaces
.implements Lcom/vkontakte/android/functions/F1;
.implements Lcom/vkontakte/android/functions/VoidF;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/PlaylistContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "InfoHeaderCreatorBinder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/functions/F1",
        "<",
        "Landroid/view/View;",
        "Landroid/view/ViewGroup;",
        ">;",
        "Lcom/vkontakte/android/functions/VoidF;"
    }
.end annotation


# instance fields
.field artistListener:Landroid/view/View$OnClickListener;

.field description:Landroid/widget/TextView;

.field followButton:Landroid/widget/CheckedTextView;

.field image:Lcom/vk/music/view/ThumbsImageView;

.field owner:Landroid/widget/TextView;

.field ownerListener:Landroid/view/View$OnClickListener;

.field snippet1:Landroid/widget/TextView;

.field snippet2:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vk/music/view/PlaylistContainer;

.field title:Landroid/widget/TextView;


# direct methods
.method private constructor <init>(Lcom/vk/music/view/PlaylistContainer;)V
    .locals 1

    .prologue
    .line 135
    iput-object p1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/PlaylistContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    invoke-static {p0}, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder$$Lambda$1;->lambdaFactory$(Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->ownerListener:Landroid/view/View$OnClickListener;

    .line 138
    invoke-static {p0}, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder$$Lambda$2;->lambdaFactory$(Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->artistListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/music/view/PlaylistContainer;Lcom/vk/music/view/PlaylistContainer$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/music/view/PlaylistContainer;
    .param p2, "x1"    # Lcom/vk/music/view/PlaylistContainer$1;

    .prologue
    .line 135
    invoke-direct {p0, p1}, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;-><init>(Lcom/vk/music/view/PlaylistContainer;)V

    return-void
.end method


# virtual methods
.method public f(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v3, 0x0

    .line 146
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->inflater:Landroid/view/LayoutInflater;

    const v2, 0x7f030140

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 147
    .local v0, "view":Landroid/view/View;
    const v1, 0x7f1003cb

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/music/view/ThumbsImageView;

    iput-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->image:Lcom/vk/music/view/ThumbsImageView;

    .line 148
    const v1, 0x7f1003cc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->title:Landroid/widget/TextView;

    .line 149
    const v1, 0x7f1003dd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->owner:Landroid/widget/TextView;

    .line 150
    const v1, 0x7f1003de

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->snippet1:Landroid/widget/TextView;

    .line 151
    const v1, 0x7f1003e0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->snippet2:Landroid/widget/TextView;

    .line 152
    const v1, 0x7f1003cd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->description:Landroid/widget/TextView;

    .line 153
    const v1, 0x7f1003df

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckedTextView;

    iput-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->followButton:Landroid/widget/CheckedTextView;

    .line 155
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->isCurrentUser()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 156
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->followButton:Landroid/widget/CheckedTextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/CheckedTextView;->setVisibility(I)V

    .line 161
    :goto_0
    return-object v0

    .line 158
    :cond_0
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->followButton:Landroid/widget/CheckedTextView;

    invoke-virtual {v1, v3}, Landroid/widget/CheckedTextView;->setVisibility(I)V

    .line 159
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->followButton:Landroid/widget/CheckedTextView;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistContainer;->userListener:Lcom/vk/music/view/PlaylistContainer$UserListener;

    invoke-virtual {v1, v2}, Landroid/widget/CheckedTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0
.end method

.method public bridge synthetic f(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 135
    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p0, p1}, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->f(Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public f()V
    .locals 9

    .prologue
    const v3, 0x7f0f0121

    const/16 v8, 0x8

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 166
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->getPlaylist()Lcom/vk/music/dto/Playlist;

    move-result-object v0

    .line 167
    .local v0, "playlist":Lcom/vk/music/dto/Playlist;
    if-eqz v0, :cond_0

    .line 168
    iget-object v1, v0, Lcom/vk/music/dto/Playlist;->photo:Lcom/vk/music/dto/Thumb;

    if-eqz v1, :cond_1

    .line 169
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->image:Lcom/vk/music/view/ThumbsImageView;

    iget-object v2, v0, Lcom/vk/music/dto/Playlist;->photo:Lcom/vk/music/dto/Thumb;

    invoke-virtual {v1, v2}, Lcom/vk/music/view/ThumbsImageView;->setThumb(Lcom/vk/music/dto/Thumb;)V

    .line 173
    :goto_0
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->title:Landroid/widget/TextView;

    iget-object v2, v0, Lcom/vk/music/dto/Playlist;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    iget v1, v0, Lcom/vk/music/dto/Playlist;->ownerId:I

    if-gez v1, :cond_2

    iget-object v1, v0, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    if-eqz v1, :cond_2

    iget-object v1, v0, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 175
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->owner:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->artistListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 176
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->owner:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistContainer;->resourcer:Lcom/vk/core/util/Resourcer;

    invoke-virtual {v2, v3}, Lcom/vk/core/util/Resourcer;->colorList(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 177
    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->owner:Landroid/widget/TextView;

    iget-object v1, v0, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/music/dto/Artist;

    iget-object v1, v1, Lcom/vk/music/dto/Artist;->name:Ljava/lang/String;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 191
    :goto_1
    iget-object v1, v0, Lcom/vk/music/dto/Playlist;->genres:Ljava/util/List;

    invoke-static {v1}, Lcom/vk/core/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_5

    iget v1, v0, Lcom/vk/music/dto/Playlist;->year:I

    if-eqz v1, :cond_5

    .line 192
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->snippet1:Landroid/widget/TextView;

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 197
    :goto_2
    iget-object v1, v0, Lcom/vk/music/dto/Playlist;->description:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 198
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->description:Landroid/widget/TextView;

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 203
    :goto_3
    iget-wide v2, v0, Lcom/vk/music/dto/Playlist;->updateTime:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-nez v1, :cond_7

    .line 204
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->snippet2:Landroid/widget/TextView;

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 209
    :goto_4
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v1, v1, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v1}, Lcom/vk/music/model/PlaylistModel;->isFollowed()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 210
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->followButton:Landroid/widget/CheckedTextView;

    invoke-virtual {v1, v7}, Landroid/widget/CheckedTextView;->setChecked(Z)V

    .line 211
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->followButton:Landroid/widget/CheckedTextView;

    const v2, 0x7f0803cb

    invoke-virtual {v1, v2}, Landroid/widget/CheckedTextView;->setText(I)V

    .line 212
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->followButton:Landroid/widget/CheckedTextView;

    const v2, 0x7f020152

    const v3, 0x7f0f0092

    invoke-static {v1, v2, v3}, Lcom/vk/core/util/DrawableUtils;->setLeft(Landroid/widget/TextView;II)V

    .line 219
    :cond_0
    :goto_5
    return-void

    .line 171
    :cond_1
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->image:Lcom/vk/music/view/ThumbsImageView;

    iget-object v2, v0, Lcom/vk/music/dto/Playlist;->thumbs:Ljava/util/List;

    invoke-virtual {v1, v2}, Lcom/vk/music/view/ThumbsImageView;->setThumbs(Ljava/util/List;)V

    goto/16 :goto_0

    .line 178
    :cond_2
    iget v1, v0, Lcom/vk/music/dto/Playlist;->type:I

    if-ne v1, v7, :cond_4

    .line 179
    iget-object v1, v0, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v7, :cond_3

    .line 180
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->owner:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->artistListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 181
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->owner:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistContainer;->resourcer:Lcom/vk/core/util/Resourcer;

    invoke-virtual {v2, v3}, Lcom/vk/core/util/Resourcer;->colorList(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 185
    :goto_6
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->owner:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistContainer;->resourcer:Lcom/vk/core/util/Resourcer;

    iget-object v3, v0, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    invoke-static {v2, v3}, Lcom/vk/music/formatter/PlaylistFormatter;->formatArtists(Lcom/vk/core/util/Resourcer;Ljava/util/List;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 183
    :cond_3
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->owner:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistContainer;->resourcer:Lcom/vk/core/util/Resourcer;

    const v3, 0x7f0f0097

    invoke-virtual {v2, v3}, Lcom/vk/core/util/Resourcer;->color(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_6

    .line 187
    :cond_4
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->owner:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->ownerListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 188
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->owner:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistContainer;->resourcer:Lcom/vk/core/util/Resourcer;

    invoke-virtual {v2, v3}, Lcom/vk/core/util/Resourcer;->colorList(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 189
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->owner:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistContainer;->model:Lcom/vk/music/model/PlaylistModel;

    invoke-interface {v2}, Lcom/vk/music/model/PlaylistModel;->getOwner()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 194
    :cond_5
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->snippet1:Landroid/widget/TextView;

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 195
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->snippet1:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistContainer;->resourcer:Lcom/vk/core/util/Resourcer;

    iget-object v3, v0, Lcom/vk/music/dto/Playlist;->genres:Ljava/util/List;

    iget v4, v0, Lcom/vk/music/dto/Playlist;->year:I

    invoke-static {v2, v3, v4}, Lcom/vk/music/formatter/PlaylistFormatter;->formatGenreYear(Lcom/vk/core/util/Resourcer;Ljava/util/List;I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 200
    :cond_6
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->description:Landroid/widget/TextView;

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 201
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->description:Landroid/widget/TextView;

    iget-object v2, v0, Lcom/vk/music/dto/Playlist;->description:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_3

    .line 206
    :cond_7
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->snippet2:Landroid/widget/TextView;

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 207
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->snippet2:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v2, v2, Lcom/vk/music/view/PlaylistContainer;->resourcer:Lcom/vk/core/util/Resourcer;

    iget v3, v0, Lcom/vk/music/dto/Playlist;->listeningsCount:I

    iget-wide v4, v0, Lcom/vk/music/dto/Playlist;->updateTime:J

    invoke-static {v2, v3, v4, v5}, Lcom/vk/music/formatter/PlaylistFormatter;->formatListeningsUpdateTime(Lcom/vk/core/util/Resourcer;IJ)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_4

    .line 214
    :cond_8
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->followButton:Landroid/widget/CheckedTextView;

    invoke-virtual {v1, v6}, Landroid/widget/CheckedTextView;->setChecked(Z)V

    .line 215
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->followButton:Landroid/widget/CheckedTextView;

    const v2, 0x7f0803ca

    invoke-virtual {v1, v2}, Landroid/widget/CheckedTextView;->setText(I)V

    .line 216
    iget-object v1, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->followButton:Landroid/widget/CheckedTextView;

    const v2, 0x7f02015e

    const v3, 0x7f0f0093

    invoke-static {v1, v2, v3}, Lcom/vk/core/util/DrawableUtils;->setLeft(Landroid/widget/TextView;II)V

    goto/16 :goto_5
.end method

.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 137
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/PlaylistContainer;->userListener:Lcom/vk/music/view/PlaylistContainer$UserListener;

    invoke-virtual {v0}, Lcom/vk/music/view/PlaylistContainer$UserListener;->onOwnerClick()V

    return-void
.end method

.method synthetic lambda$new$1(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/vk/music/view/PlaylistContainer$InfoHeaderCreatorBinder;->this$0:Lcom/vk/music/view/PlaylistContainer;

    iget-object v0, v0, Lcom/vk/music/view/PlaylistContainer;->userListener:Lcom/vk/music/view/PlaylistContainer$UserListener;

    invoke-virtual {v0}, Lcom/vk/music/view/PlaylistContainer$UserListener;->onArtistClick()V

    return-void
.end method
