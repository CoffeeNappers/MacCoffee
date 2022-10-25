.class public Lcom/vk/stories/ShareStoryActivity;
.super Lcom/vkontakte/android/VKActivity;
.source "ShareStoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/stories/ShareStoryActivity$HeaderHolder;,
        Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;
    }
.end annotation


# static fields
.field public static final INTENT_IMAGE_FILE:Ljava/lang/String; = "image_file"

.field public static final INTENT_STORY_UPLOAD_PARAM:Ljava/lang/String; = "story_upload_param"

.field public static final INTENT_VIDEO_RENDER_PARAMS:Ljava/lang/String; = "video_render_params"


# instance fields
.field private adapter:Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;

.field private emptyView:Landroid/widget/TextView;

.field private header:Landroid/view/View;

.field private imageFile:Ljava/io/File;

.field private list:Lcom/vk/stories/view/ShareStoryRecyclerView;

.field private myAvatar:Lcom/vk/imageloader/view/VKImageView;

.field private nonEmptyView:Landroid/widget/TextView;

.field private searchIndexer:Lcom/vkontakte/android/fragments/friends/SearchIndexer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/fragments/friends/SearchIndexer",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

.field private final selectedUsers:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private sendButton:Landroid/widget/TextView;

.field private shareToNews:Z

.field private storyShareCheckBox:Landroid/widget/CheckBox;

.field private storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;

.field private toolbar:Landroid/support/v7/widget/Toolbar;

.field private final users:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private videoCompressorParameters:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/vkontakte/android/VKActivity;-><init>()V

    .line 68
    new-instance v0, Lcom/vkontakte/android/fragments/friends/SearchIndexer;

    new-instance v1, Lcom/vk/stories/ShareStoryActivity$1;

    invoke-direct {v1, p0}, Lcom/vk/stories/ShareStoryActivity$1;-><init>(Lcom/vk/stories/ShareStoryActivity;)V

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/friends/SearchIndexer;-><init>(Lcom/vkontakte/android/fragments/friends/SearchIndexer$Provider;)V

    iput-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->searchIndexer:Lcom/vkontakte/android/fragments/friends/SearchIndexer;

    .line 83
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->users:Ljava/util/ArrayList;

    .line 85
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->selectedUsers:Ljava/util/HashSet;

    .line 86
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/stories/ShareStoryActivity;->shareToNews:Z

    return-void
.end method

.method static synthetic access$000(Lcom/vk/stories/ShareStoryActivity;)Lcom/vk/stories/view/ShareStoryRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/ShareStoryActivity;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->list:Lcom/vk/stories/view/ShareStoryRecyclerView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/stories/ShareStoryActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/ShareStoryActivity;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->emptyView:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vk/stories/ShareStoryActivity;)Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/ShareStoryActivity;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->imageFile:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vk/stories/ShareStoryActivity;)Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/ShareStoryActivity;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->videoCompressorParameters:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vk/stories/ShareStoryActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/ShareStoryActivity;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->header:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vk/stories/ShareStoryActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/ShareStoryActivity;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->nonEmptyView:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vk/stories/ShareStoryActivity;)Lcom/vkontakte/android/fragments/friends/SearchIndexer;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/ShareStoryActivity;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->searchIndexer:Lcom/vkontakte/android/fragments/friends/SearchIndexer;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vk/stories/ShareStoryActivity;)Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/ShareStoryActivity;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->adapter:Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vk/stories/ShareStoryActivity;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/ShareStoryActivity;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->users:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vk/stories/ShareStoryActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/ShareStoryActivity;

    .prologue
    .line 46
    iget-boolean v0, p0, Lcom/vk/stories/ShareStoryActivity;->shareToNews:Z

    return v0
.end method

.method static synthetic access$502(Lcom/vk/stories/ShareStoryActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/ShareStoryActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 46
    iput-boolean p1, p0, Lcom/vk/stories/ShareStoryActivity;->shareToNews:Z

    return p1
.end method

.method static synthetic access$600(Lcom/vk/stories/ShareStoryActivity;)Landroid/widget/CheckBox;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/ShareStoryActivity;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->storyShareCheckBox:Landroid/widget/CheckBox;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vk/stories/ShareStoryActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/stories/ShareStoryActivity;

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/vk/stories/ShareStoryActivity;->checkUIState()V

    return-void
.end method

.method static synthetic access$800(Lcom/vk/stories/ShareStoryActivity;)Ljava/util/HashSet;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/ShareStoryActivity;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->selectedUsers:Ljava/util/HashSet;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vk/stories/ShareStoryActivity;)Lcom/vk/stories/model/StoryUploadParams;
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/ShareStoryActivity;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;

    return-object v0
.end method

.method private checkUIState()V
    .locals 9

    .prologue
    const v8, 0x7f0d005b

    const v7, 0x7f0806ca

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 217
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 218
    .local v1, "subtitleBuilder":Ljava/lang/StringBuilder;
    iget-boolean v3, p0, Lcom/vk/stories/ShareStoryActivity;->shareToNews:Z

    if-eqz v3, :cond_0

    .line 219
    const v3, 0x7f080412

    invoke-virtual {p0, v3}, Lcom/vk/stories/ShareStoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    :cond_0
    iget-object v3, p0, Lcom/vk/stories/ShareStoryActivity;->selectedUsers:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->size()I

    move-result v3

    if-lez v3, :cond_1

    .line 222
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/vk/stories/ShareStoryActivity;->selectedUsers:Ljava/util/HashSet;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 225
    .local v2, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    iget-boolean v3, p0, Lcom/vk/stories/ShareStoryActivity;->shareToNews:Z

    if-eqz v3, :cond_4

    .line 226
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v3, v6, :cond_3

    .line 227
    const-string/jumbo v3, ", "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/UserProfile;

    iget-object v3, v3, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    .end local v2    # "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_1
    :goto_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_7

    .line 255
    iget-object v3, p0, Lcom/vk/stories/ShareStoryActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    const v4, 0x7f0b0197

    invoke-virtual {v3, p0, v4}, Landroid/support/v7/widget/Toolbar;->setTitleTextAppearance(Landroid/content/Context;I)V

    .line 256
    iget-object v3, p0, Lcom/vk/stories/ShareStoryActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 262
    :goto_1
    iget-boolean v3, p0, Lcom/vk/stories/ShareStoryActivity;->shareToNews:Z

    if-nez v3, :cond_2

    iget-object v3, p0, Lcom/vk/stories/ShareStoryActivity;->selectedUsers:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->size()I

    move-result v3

    if-lez v3, :cond_8

    .line 263
    :cond_2
    iget-object v3, p0, Lcom/vk/stories/ShareStoryActivity;->sendButton:Landroid/widget/TextView;

    const v4, 0x7f0200df

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 264
    iget-object v3, p0, Lcom/vk/stories/ShareStoryActivity;->sendButton:Landroid/widget/TextView;

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 269
    :goto_2
    return-void

    .line 229
    .restart local v2    # "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_3
    const-string/jumbo v3, " "

    .line 230
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, v7}, Lcom/vk/stories/ShareStoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 231
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " "

    .line 232
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 233
    invoke-virtual {p0}, Lcom/vk/stories/ShareStoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v4, v8, v5}, Landroid/content/res/Resources;->getQuantityString(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 236
    :cond_4
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x3

    if-gt v3, v4, :cond_6

    .line 237
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 238
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/UserProfile;

    iget-object v3, v3, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_5

    .line 240
    const-string/jumbo v3, ", "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 245
    .end local v0    # "i":I
    :cond_6
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/UserProfile;

    iget-object v3, v3, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 246
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/UserProfile;

    iget-object v3, v3, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " "

    .line 247
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, v7}, Lcom/vk/stories/ShareStoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 248
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " "

    .line 249
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 250
    invoke-virtual {p0}, Lcom/vk/stories/ShareStoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x2

    invoke-virtual {v4, v8, v5}, Landroid/content/res/Resources;->getQuantityString(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 258
    .end local v2    # "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    :cond_7
    iget-object v3, p0, Lcom/vk/stories/ShareStoryActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    const v4, 0x7f0b0196

    invoke-virtual {v3, p0, v4}, Landroid/support/v7/widget/Toolbar;->setTitleTextAppearance(Landroid/content/Context;I)V

    .line 259
    iget-object v3, p0, Lcom/vk/stories/ShareStoryActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/Toolbar;->setSubtitle(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 266
    :cond_8
    iget-object v3, p0, Lcom/vk/stories/ShareStoryActivity;->sendButton:Landroid/widget/TextView;

    const v4, -0x19191a

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 267
    iget-object v3, p0, Lcom/vk/stories/ShareStoryActivity;->sendButton:Landroid/widget/TextView;

    const v4, -0x6f6b67

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_2
.end method

.method private doLoadData()V
    .locals 2

    .prologue
    .line 272
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->users:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/vkontakte/android/data/Friends;->getFriends(Ljava/util/ArrayList;)V

    .line 273
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->searchIndexer:Lcom/vkontakte/android/fragments/friends/SearchIndexer;

    iget-object v1, p0, Lcom/vk/stories/ShareStoryActivity;->users:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/SearchIndexer;->bind(Ljava/util/List;)V

    .line 274
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->searchIndexer:Lcom/vkontakte/android/fragments/friends/SearchIndexer;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/SearchIndexer;->build()V

    .line 275
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->adapter:Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;

    iget-object v1, p0, Lcom/vk/stories/ShareStoryActivity;->users:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->setData(Ljava/util/ArrayList;)V

    .line 276
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "b"    # Landroid/os/Bundle;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 91
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onCreate(Landroid/os/Bundle;)V

    .line 93
    invoke-virtual {p0}, Lcom/vk/stories/ShareStoryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "video_render_params"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    iput-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->videoCompressorParameters:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    .line 94
    invoke-virtual {p0}, Lcom/vk/stories/ShareStoryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "image_file"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    iput-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->imageFile:Ljava/io/File;

    .line 95
    invoke-virtual {p0}, Lcom/vk/stories/ShareStoryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "story_upload_param"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoryUploadParams;

    iput-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;

    .line 96
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;

    if-nez v0, :cond_0

    .line 97
    new-instance v0, Lcom/vk/stories/model/StoryUploadParams;

    invoke-direct {v0}, Lcom/vk/stories/model/StoryUploadParams;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->storyUploadParams:Lcom/vk/stories/model/StoryUploadParams;

    .line 100
    :cond_0
    const v0, 0x7f030020

    invoke-virtual {p0, v0}, Lcom/vk/stories/ShareStoryActivity;->setContentView(I)V

    .line 101
    const v0, 0x7f10018a

    invoke-virtual {p0, v0}, Lcom/vk/stories/ShareStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/view/ShareStoryRecyclerView;

    iput-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->list:Lcom/vk/stories/view/ShareStoryRecyclerView;

    .line 102
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->list:Lcom/vk/stories/view/ShareStoryRecyclerView;

    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    invoke-virtual {v0, v5, v1, v5, v5}, Lcom/vk/stories/view/ShareStoryRecyclerView;->setPadding(IIII)V

    .line 103
    new-instance v0, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;

    invoke-direct {v0, p0, p0}, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;-><init>(Lcom/vk/stories/ShareStoryActivity;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->adapter:Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;

    .line 104
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->list:Lcom/vk/stories/view/ShareStoryRecyclerView;

    new-instance v1, Landroid/support/v7/widget/GridLayoutManager;

    invoke-direct {v1, p0, v6}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/ShareStoryRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 105
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->list:Lcom/vk/stories/view/ShareStoryRecyclerView;

    iget-object v1, p0, Lcom/vk/stories/ShareStoryActivity;->adapter:Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/ShareStoryRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 106
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->list:Lcom/vk/stories/view/ShareStoryRecyclerView;

    new-instance v1, Lcom/vk/stories/ShareStoryActivity$2;

    invoke-direct {v1, p0}, Lcom/vk/stories/ShareStoryActivity$2;-><init>(Lcom/vk/stories/ShareStoryActivity;)V

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/ShareStoryRecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 115
    const v0, 0x7f1001b0

    invoke-virtual {p0, v0}, Lcom/vk/stories/ShareStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    iput-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    .line 116
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Lcom/vk/stories/ShareStoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vk/stories/ShareStoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f02014f

    invoke-static {v3, v4}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(Landroid/graphics/drawable/Drawable;)V

    .line 117
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getNavigationIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const v1, 0x7f0f00ba

    invoke-static {p0, v1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 118
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    new-instance v1, Lcom/vk/stories/ShareStoryActivity$3;

    invoke-direct {v1, p0}, Lcom/vk/stories/ShareStoryActivity$3;-><init>(Lcom/vk/stories/ShareStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 124
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    const v1, 0x7f080658

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setTitle(I)V

    .line 125
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    const v1, 0x7f0b0196

    invoke-virtual {v0, p0, v1}, Landroid/support/v7/widget/Toolbar;->setTitleTextAppearance(Landroid/content/Context;I)V

    .line 126
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    const v1, 0x7f0b0195

    invoke-virtual {v0, p0, v1}, Landroid/support/v7/widget/Toolbar;->setSubtitleTextAppearance(Landroid/content/Context;I)V

    .line 128
    invoke-static {}, Lcom/vkontakte/android/utils/OsUtil;->isAtLeastL()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 129
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setElevation(F)V

    .line 131
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    new-instance v1, Lcom/vk/stories/ShareStoryActivity$4;

    invoke-direct {v1, p0}, Lcom/vk/stories/ShareStoryActivity$4;-><init>(Lcom/vk/stories/ShareStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 140
    new-instance v0, Lcom/vkontakte/android/ui/SearchViewWrapper;

    new-instance v1, Lcom/vk/stories/ShareStoryActivity$5;

    invoke-direct {v1, p0}, Lcom/vk/stories/ShareStoryActivity$5;-><init>(Lcom/vk/stories/ShareStoryActivity;)V

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;-><init>(Landroid/app/Activity;Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;)V

    iput-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    .line 159
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    iget-object v1, p0, Lcom/vk/stories/ShareStoryActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1}, Landroid/support/v7/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->onCreateOptionsMenu(Landroid/view/Menu;)V

    .line 160
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setShowVoiceOnEmpty(Z)V

    .line 162
    invoke-virtual {p0}, Lcom/vk/stories/ShareStoryActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0300e1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->header:Landroid/view/View;

    .line 163
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->header:Landroid/view/View;

    new-instance v1, Lcom/vk/stories/ShareStoryActivity$6;

    invoke-direct {v1, p0}, Lcom/vk/stories/ShareStoryActivity$6;-><init>(Lcom/vk/stories/ShareStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 171
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->header:Landroid/view/View;

    const v1, 0x7f100341

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->storyShareCheckBox:Landroid/widget/CheckBox;

    .line 172
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->storyShareCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {v0, v6}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 173
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->storyShareCheckBox:Landroid/widget/CheckBox;

    new-instance v1, Lcom/vk/stories/ShareStoryActivity$7;

    invoke-direct {v1, p0}, Lcom/vk/stories/ShareStoryActivity$7;-><init>(Lcom/vk/stories/ShareStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 180
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->header:Landroid/view/View;

    const v1, 0x7f100343

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->emptyView:Landroid/widget/TextView;

    .line 181
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->header:Landroid/view/View;

    const v1, 0x7f100342

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->nonEmptyView:Landroid/widget/TextView;

    .line 182
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->header:Landroid/view/View;

    const v1, 0x7f1001e8

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->myAvatar:Lcom/vk/imageloader/view/VKImageView;

    .line 183
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->myAvatar:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 185
    const v0, 0x7f10018b

    invoke-virtual {p0, v0}, Lcom/vk/stories/ShareStoryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->sendButton:Landroid/widget/TextView;

    .line 186
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity;->sendButton:Landroid/widget/TextView;

    new-instance v1, Lcom/vk/stories/ShareStoryActivity$8;

    invoke-direct {v1, p0}, Lcom/vk/stories/ShareStoryActivity$8;-><init>(Lcom/vk/stories/ShareStoryActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 211
    invoke-direct {p0}, Lcom/vk/stories/ShareStoryActivity;->checkUIState()V

    .line 213
    invoke-direct {p0}, Lcom/vk/stories/ShareStoryActivity;->doLoadData()V

    .line 214
    return-void
.end method
