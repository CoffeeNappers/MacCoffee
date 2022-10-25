.class public Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;
.super Lme/grishka/appkit/fragments/ToolbarFragment;
.source "EditAlbumFragment.java"


# static fields
.field private static final PRIVACY_COMMENT_RESULT:I = 0x2068

.field private static final PRIVACY_VIEW_RESULT:I = 0x2067


# instance fields
.field private album:Lcom/vkontakte/android/api/PhotoAlbum;

.field private description:Landroid/widget/EditText;

.field private groupPrivacyBtn:Landroid/view/View;

.field private groupPrivacyCheck:Landroid/widget/CheckBox;

.field private groupPrivacyCommentBtn:Landroid/view/View;

.field private groupPrivacyCommentCheck:Landroid/widget/CheckBox;

.field private oid:I

.field private privacyBtn:Landroid/view/View;

.field private privacyCommentBtn:Landroid/view/View;

.field private privacyCommentsSpinner:Landroid/widget/TextView;

.field private privacySpinner:Landroid/widget/TextView;

.field private title:Landroid/widget/EditText;

.field private view:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lme/grishka/appkit/fragments/ToolbarFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Lcom/vkontakte/android/api/PhotoAlbum;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->title:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->description:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacyBtn:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacyCommentBtn:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Landroid/widget/CheckBox;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->groupPrivacyCheck:Landroid/widget/CheckBox;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Landroid/widget/CheckBox;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->groupPrivacyCommentCheck:Landroid/widget/CheckBox;

    return-object v0
.end method

.method private save()V
    .locals 7

    .prologue
    .line 161
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    if-nez v1, :cond_1

    .line 163
    iget v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->oid:I

    if-lez v1, :cond_0

    .line 164
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosCreateAlbum;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->title:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->description:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacyBtn:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/data/PrivacySetting;

    invoke-virtual {v3}, Lcom/vkontakte/android/data/PrivacySetting;->getApiValue()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacyCommentBtn:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/data/PrivacySetting;

    invoke-virtual {v4}, Lcom/vkontakte/android/data/PrivacySetting;->getApiValue()Ljava/lang/String;

    move-result-object v4

    iget v5, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->oid:I

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/photos/PhotosCreateAlbum;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 168
    .local v0, "r":Lcom/vkontakte/android/api/photos/PhotosCreateAlbum;
    :goto_0
    new-instance v1, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$1;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$1;-><init>(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosCreateAlbum;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 176
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 200
    .end local v0    # "r":Lcom/vkontakte/android/api/photos/PhotosCreateAlbum;
    :goto_1
    return-void

    .line 166
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosCreateAlbum;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->title:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->description:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->groupPrivacyCheck:Landroid/widget/CheckBox;

    invoke-virtual {v3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->groupPrivacyCommentCheck:Landroid/widget/CheckBox;

    invoke-virtual {v4}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v4

    iget v5, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->oid:I

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/photos/PhotosCreateAlbum;-><init>(Ljava/lang/String;Ljava/lang/String;ZZI)V

    .restart local v0    # "r":Lcom/vkontakte/android/api/photos/PhotosCreateAlbum;
    goto :goto_0

    .line 179
    .end local v0    # "r":Lcom/vkontakte/android/api/photos/PhotosCreateAlbum;
    :cond_1
    iget v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->oid:I

    if-lez v1, :cond_2

    .line 180
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosEditAlbum;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v1, v1, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->title:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->description:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacyBtn:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/data/PrivacySetting;

    invoke-virtual {v4}, Lcom/vkontakte/android/data/PrivacySetting;->getApiValue()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacyCommentBtn:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/data/PrivacySetting;

    invoke-virtual {v5}, Lcom/vkontakte/android/data/PrivacySetting;->getApiValue()Ljava/lang/String;

    move-result-object v5

    iget v6, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->oid:I

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/api/photos/PhotosEditAlbum;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 184
    .local v0, "r":Lcom/vkontakte/android/api/photos/PhotosEditAlbum;
    :goto_2
    new-instance v1, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$2;-><init>(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosEditAlbum;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 198
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_1

    .line 182
    .end local v0    # "r":Lcom/vkontakte/android/api/photos/PhotosEditAlbum;
    :cond_2
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosEditAlbum;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v1, v1, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->title:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->description:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->groupPrivacyCheck:Landroid/widget/CheckBox;

    invoke-virtual {v4}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->groupPrivacyCommentCheck:Landroid/widget/CheckBox;

    invoke-virtual {v5}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v5

    iget v6, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->oid:I

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/api/photos/PhotosEditAlbum;-><init>(ILjava/lang/String;Ljava/lang/String;ZZI)V

    .restart local v0    # "r":Lcom/vkontakte/android/api/photos/PhotosEditAlbum;
    goto :goto_2
.end method

.method private updateDecorator()V
    .locals 12

    .prologue
    const/high16 v11, 0x40000000    # 2.0f

    const/4 v7, 0x0

    .line 87
    iget-object v6, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->view:Landroid/view/View;

    check-cast v6, Landroid/view/ViewGroup;

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    .line 88
    .local v5, "vg":Landroid/view/ViewGroup;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    if-ge v2, v6, :cond_1

    .line 89
    new-instance v0, Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const/4 v9, -0x1

    invoke-static {v11}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    int-to-float v10, v6

    iget-boolean v6, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->isTablet:Z

    if-nez v6, :cond_0

    const/4 v6, 0x1

    :goto_1
    invoke-direct {v0, v8, v9, v10, v6}, Lcom/vkontakte/android/ui/cardview/CardDrawable;-><init>(Landroid/content/res/Resources;IFZ)V

    .line 90
    .local v0, "bg":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 91
    .local v1, "c":Landroid/view/View;
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 92
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 93
    .local v3, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    const/high16 v6, 0x40400000    # 3.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    iput v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 94
    invoke-static {v11}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    iput v6, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 88
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v0    # "bg":Landroid/graphics/drawable/Drawable;
    .end local v1    # "c":Landroid/view/View;
    .end local v3    # "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_0
    move v6, v7

    .line 89
    goto :goto_1

    .line 96
    :cond_1
    iget v6, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->scrW:I

    const/16 v8, 0x39c

    if-lt v6, v8, :cond_2

    const/high16 v6, 0x42000000    # 32.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    .line 97
    .local v4, "pad":I
    :goto_2
    invoke-virtual {v5, v4, v7, v4, v7}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 98
    return-void

    .end local v4    # "pad":I
    :cond_2
    move v4, v7

    .line 96
    goto :goto_2
.end method


# virtual methods
.method synthetic lambda$onCreateContentView$0(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 125
    new-instance v1, Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;-><init>()V

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/PrivacySetting;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;->setSetting(Lcom/vkontakte/android/data/PrivacySetting;)Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;

    move-result-object v0

    const/16 v1, 0x2067

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    return-void
.end method

.method synthetic lambda$onCreateContentView$1(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 126
    new-instance v1, Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;-><init>()V

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/PrivacySetting;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;->setSetting(Lcom/vkontakte/android/data/PrivacySetting;)Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;

    move-result-object v0

    const/16 v1, 0x2068

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v4, -0x1

    .line 203
    const/16 v2, 0x2067

    if-ne p1, v2, :cond_0

    if-ne p2, v4, :cond_0

    .line 204
    const-string/jumbo v2, "setting"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/PrivacySetting;

    .line 205
    .local v1, "viewPrivacy":Lcom/vkontakte/android/data/PrivacySetting;
    if-eqz v1, :cond_0

    .line 206
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacySpinner:Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/vkontakte/android/data/PrivacySetting;->getDisplayString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 207
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacyBtn:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 210
    .end local v1    # "viewPrivacy":Lcom/vkontakte/android/data/PrivacySetting;
    :cond_0
    const/16 v2, 0x2068

    if-ne p1, v2, :cond_1

    if-ne p2, v4, :cond_1

    .line 211
    const-string/jumbo v2, "setting"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/PrivacySetting;

    .line 212
    .local v0, "commentPrivacy":Lcom/vkontakte/android/data/PrivacySetting;
    if-eqz v0, :cond_1

    .line 213
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacyCommentsSpinner:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/vkontakte/android/data/PrivacySetting;->getDisplayString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 214
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacyCommentBtn:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 217
    .end local v0    # "commentPrivacy":Lcom/vkontakte/android/data/PrivacySetting;
    :cond_1
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 51
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/ToolbarFragment;->onAttach(Landroid/app/Activity;)V

    .line 52
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "album"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/PhotoAlbum;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    .line 53
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "owner_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->oid:I

    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    if-eqz v0, :cond_0

    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v0, v0, Lcom/vkontakte/android/api/PhotoAlbum;->oid:I

    iput v0, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->oid:I

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    if-eqz v0, :cond_1

    const v0, 0x7f0801c8

    :goto_0
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->setTitle(I)V

    .line 58
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->setHasOptionsMenu(Z)V

    .line 59
    return-void

    .line 57
    :cond_1
    const v0, 0x7f080187

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 81
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/ToolbarFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 82
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->updateConfiguration()V

    .line 83
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->updateDecorator()V

    .line 84
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 10
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x2

    const/16 v7, 0x8

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 110
    const v2, 0x7f030188

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->view:Landroid/view/View;

    .line 111
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->view:Landroid/view/View;

    const v3, 0x7f100128

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->title:Landroid/widget/EditText;

    .line 112
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->view:Landroid/view/View;

    const v3, 0x7f1001cc

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->description:Landroid/widget/EditText;

    .line 113
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->view:Landroid/view/View;

    const v3, 0x7f10043e

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacySpinner:Landroid/widget/TextView;

    .line 114
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->view:Landroid/view/View;

    const v3, 0x7f100440

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacyCommentsSpinner:Landroid/widget/TextView;

    .line 115
    new-instance v1, Lcom/vkontakte/android/data/PrivacySetting;

    invoke-direct {v1}, Lcom/vkontakte/android/data/PrivacySetting;-><init>()V

    .line 116
    .local v1, "viewPrivacy":Lcom/vkontakte/android/data/PrivacySetting;
    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/String;

    const-string/jumbo v3, "all"

    aput-object v3, v2, v5

    const-string/jumbo v3, "friends"

    aput-object v3, v2, v6

    const-string/jumbo v3, "friends_of_friends"

    aput-object v3, v2, v8

    const-string/jumbo v3, "only_me"

    aput-object v3, v2, v9

    const/4 v3, 0x4

    const-string/jumbo v4, "some"

    aput-object v4, v2, v3

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    iput-object v2, v1, Lcom/vkontakte/android/data/PrivacySetting;->possibleRules:Ljava/util/List;

    .line 117
    const v2, 0x7f080189

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/vkontakte/android/data/PrivacySetting;->title:Ljava/lang/String;

    .line 118
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget-object v2, v2, Lcom/vkontakte/android/api/PhotoAlbum;->privacy:Ljava/util/List;

    :goto_0
    iput-object v2, v1, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    .line 119
    new-instance v0, Lcom/vkontakte/android/data/PrivacySetting;

    invoke-direct {v0}, Lcom/vkontakte/android/data/PrivacySetting;-><init>()V

    .line 120
    .local v0, "commentPrivacy":Lcom/vkontakte/android/data/PrivacySetting;
    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/String;

    const-string/jumbo v3, "all"

    aput-object v3, v2, v5

    const-string/jumbo v3, "friends"

    aput-object v3, v2, v6

    const-string/jumbo v3, "friends_of_friends"

    aput-object v3, v2, v8

    const-string/jumbo v3, "only_me"

    aput-object v3, v2, v9

    const/4 v3, 0x4

    const-string/jumbo v4, "some"

    aput-object v4, v2, v3

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    iput-object v2, v0, Lcom/vkontakte/android/data/PrivacySetting;->possibleRules:Ljava/util/List;

    .line 121
    const v2, 0x7f08018a

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/vkontakte/android/data/PrivacySetting;->title:Ljava/lang/String;

    .line 122
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget-object v2, v2, Lcom/vkontakte/android/api/PhotoAlbum;->privacyComment:Ljava/util/List;

    :goto_1
    iput-object v2, v0, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    .line 123
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->view:Landroid/view/View;

    const v3, 0x7f10043d

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacyBtn:Landroid/view/View;

    .line 124
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->view:Landroid/view/View;

    const v3, 0x7f10043f

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacyCommentBtn:Landroid/view/View;

    .line 125
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacyBtn:Landroid/view/View;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacyCommentBtn:Landroid/view/View;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 127
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacyBtn:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 128
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacyCommentBtn:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 129
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->view:Landroid/view/View;

    const v3, 0x7f100441

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->groupPrivacyBtn:Landroid/view/View;

    .line 130
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->view:Landroid/view/View;

    const v3, 0x7f100443

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->groupPrivacyCommentBtn:Landroid/view/View;

    .line 131
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->view:Landroid/view/View;

    const v3, 0x7f100442

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    iput-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->groupPrivacyCheck:Landroid/widget/CheckBox;

    .line 132
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->view:Landroid/view/View;

    const v3, 0x7f100444

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    iput-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->groupPrivacyCommentCheck:Landroid/widget/CheckBox;

    .line 133
    iget v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->oid:I

    if-gez v2, :cond_3

    .line 134
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacyBtn:Landroid/view/View;

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    .line 135
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacyCommentBtn:Landroid/view/View;

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    .line 140
    :goto_2
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    if-eqz v2, :cond_0

    .line 141
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->title:Landroid/widget/EditText;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget-object v3, v3, Lcom/vkontakte/android/api/PhotoAlbum;->title:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 142
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->description:Landroid/widget/EditText;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget-object v3, v3, Lcom/vkontakte/android/api/PhotoAlbum;->descr:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 143
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacySpinner:Landroid/widget/TextView;

    invoke-virtual {v1}, Lcom/vkontakte/android/data/PrivacySetting;->getDisplayString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->privacyCommentsSpinner:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/vkontakte/android/data/PrivacySetting;->getDisplayString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 145
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->groupPrivacyCheck:Landroid/widget/CheckBox;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget-boolean v3, v3, Lcom/vkontakte/android/api/PhotoAlbum;->uploadByAdminsOnly:Z

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 146
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->groupPrivacyCommentCheck:Landroid/widget/CheckBox;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget-boolean v3, v3, Lcom/vkontakte/android/api/PhotoAlbum;->commentsDisabled:Z

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 148
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->view:Landroid/view/View;

    return-object v2

    .line 118
    .end local v0    # "commentPrivacy":Lcom/vkontakte/android/data/PrivacySetting;
    :cond_1
    new-array v2, v6, [Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;

    sget-object v3, Lcom/vkontakte/android/data/PrivacySetting;->ALL:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    aput-object v3, v2, v5

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    goto/16 :goto_0

    .line 122
    .restart local v0    # "commentPrivacy":Lcom/vkontakte/android/data/PrivacySetting;
    :cond_2
    new-array v2, v6, [Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;

    sget-object v3, Lcom/vkontakte/android/data/PrivacySetting;->ALL:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    aput-object v3, v2, v5

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    goto/16 :goto_1

    .line 137
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->groupPrivacyBtn:Landroid/view/View;

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    .line 138
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->groupPrivacyCommentBtn:Landroid/view/View;

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 63
    const v1, 0x7f0805d9

    invoke-interface {p1, v1}, Landroid/view/Menu;->add(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 64
    .local v0, "item":Landroid/view/MenuItem;
    const v1, 0x7f020184

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 65
    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 66
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 153
    invoke-super {p0, p1, p2, p3}, Lme/grishka/appkit/fragments/ToolbarFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    .line 154
    .local v0, "v":Landroid/view/View;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->content:Landroid/view/View;

    const/high16 v2, 0x2000000

    invoke-virtual {v1, v2}, Landroid/view/View;->setScrollBarStyle(I)V

    .line 155
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->updateConfiguration()V

    .line 156
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->updateDecorator()V

    .line 157
    return-object v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->save()V

    .line 71
    const/4 v0, 0x1

    return v0
.end method

.method public onToolbarNavigationClick()V
    .locals 1

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 77
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 102
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/ToolbarFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 103
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "_split"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 104
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/EditAlbumFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const v1, 0x7f02014f

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 106
    :cond_0
    return-void
.end method
