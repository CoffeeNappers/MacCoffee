.class public Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;
.super Lme/grishka/appkit/fragments/ContainerFragment;
.source "VideoEditorFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Landroid/view/View$OnClickListener;


# static fields
.field static final PRIVACY_COMMENT_RESULT:I = 0x68

.field static final PRIVACY_RESULT:I = 0x67


# instance fields
.field mContainer:Landroid/view/ViewGroup;

.field mDoneDrawable:Landroid/graphics/drawable/Drawable;

.field mDoneEnabled:Z

.field mDoneItem:Landroid/view/MenuItem;

.field mPrivacy:Lcom/vkontakte/android/data/PrivacySetting;

.field mPrivacyComment:Lcom/vkontakte/android/data/PrivacySetting;

.field mPrivacyCommentValue:Landroid/widget/TextView;

.field mPrivacyValue:Landroid/widget/TextView;

.field mSubtitle:Landroid/widget/EditText;

.field mTitle:Landroid/widget/EditText;

.field mVideo:Lcom/vkontakte/android/api/VideoFile;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 48
    invoke-direct {p0}, Lme/grishka/appkit/fragments/ContainerFragment;-><init>()V

    .line 64
    new-instance v0, Lcom/vkontakte/android/data/PrivacySetting;

    invoke-direct {v0}, Lcom/vkontakte/android/data/PrivacySetting;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacy:Lcom/vkontakte/android/data/PrivacySetting;

    .line 65
    new-instance v0, Lcom/vkontakte/android/data/PrivacySetting;

    invoke-direct {v0}, Lcom/vkontakte/android/data/PrivacySetting;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacyComment:Lcom/vkontakte/android/data/PrivacySetting;

    .line 75
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mDoneEnabled:Z

    return-void
.end method

.method public static edit(Lcom/vkontakte/android/api/VideoFile;)Lcom/vkontakte/android/navigation/Navigator;
    .locals 5
    .param p0, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 54
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 55
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "video"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 56
    new-instance v1, Lcom/vkontakte/android/navigation/Navigator;

    const-class v2, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;

    new-instance v3, Lcom/vkontakte/android/TabletDialogActivity$Builder;

    invoke-direct {v3}, Lcom/vkontakte/android/TabletDialogActivity$Builder;-><init>()V

    const/16 v4, 0x11

    .line 57
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setGravity(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    const/16 v4, 0x10

    .line 58
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setInputMode(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    const/high16 v4, 0x44340000    # 720.0f

    .line 59
    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMaxWidth(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    const/high16 v4, 0x42000000    # 32.0f

    .line 60
    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMinSpacing(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    const v4, 0x106000b

    .line 61
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowBackgroundResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;Landroid/os/Bundle;)V

    return-object v1
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 184
    invoke-static {p1}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 185
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->enableDone(Z)V

    .line 186
    return-void

    .line 185
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 175
    return-void
.end method

.method enableDone(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 229
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mDoneEnabled:Z

    if-eq p1, v0, :cond_1

    .line 230
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mDoneEnabled:Z

    .line 231
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mDoneDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 232
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mDoneDrawable:Landroid/graphics/drawable/Drawable;

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mDoneEnabled:Z

    if-eqz v0, :cond_2

    const/16 v0, 0xff

    :goto_0
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 234
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mDoneItem:Landroid/view/MenuItem;

    if-eqz v0, :cond_1

    .line 235
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mDoneItem:Landroid/view/MenuItem;

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mDoneEnabled:Z

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 238
    :cond_1
    return-void

    .line 232
    :cond_2
    const/16 v0, 0x7f

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 196
    const/4 v1, -0x1

    if-ne p2, v1, :cond_0

    .line 197
    packed-switch p1, :pswitch_data_0

    .line 216
    :cond_0
    :goto_0
    return-void

    .line 199
    :pswitch_0
    const-string/jumbo v1, "setting"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/PrivacySetting;

    .line 200
    .local v0, "setting":Lcom/vkontakte/android/data/PrivacySetting;
    if-eqz v0, :cond_0

    .line 201
    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacy:Lcom/vkontakte/android/data/PrivacySetting;

    .line 202
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacyValue:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacy:Lcom/vkontakte/android/data/PrivacySetting;

    invoke-virtual {v2}, Lcom/vkontakte/android/data/PrivacySetting;->getDisplayString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 207
    .end local v0    # "setting":Lcom/vkontakte/android/data/PrivacySetting;
    :pswitch_1
    const-string/jumbo v1, "setting"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/PrivacySetting;

    .line 208
    .restart local v0    # "setting":Lcom/vkontakte/android/data/PrivacySetting;
    if-eqz v0, :cond_0

    .line 209
    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacyComment:Lcom/vkontakte/android/data/PrivacySetting;

    .line 210
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacyCommentValue:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacyComment:Lcom/vkontakte/android/data/PrivacySetting;

    invoke-virtual {v2}, Lcom/vkontakte/android/data/PrivacySetting;->getDisplayString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 197
    nop

    :pswitch_data_0
    .packed-switch 0x67
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 160
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 170
    :goto_0
    return-void

    .line 162
    :sswitch_0
    new-instance v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;-><init>()V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacy:Lcom/vkontakte/android/data/PrivacySetting;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;->setSetting(Lcom/vkontakte/android/data/PrivacySetting;)Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;

    move-result-object v0

    const/16 v1, 0x67

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    goto :goto_0

    .line 166
    :sswitch_1
    new-instance v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;-><init>()V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacyComment:Lcom/vkontakte/android/data/PrivacySetting;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;->setSetting(Lcom/vkontakte/android/data/PrivacySetting;)Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;

    move-result-object v0

    const/16 v1, 0x68

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    goto :goto_0

    .line 160
    :sswitch_data_0
    .sparse-switch
        0x7f1002cb -> :sswitch_0
        0x7f10057c -> :sswitch_1
    .end sparse-switch
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 190
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/ContainerFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 191
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->updateDecorator()V

    .line 192
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 80
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/ContainerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 81
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->setHasOptionsMenu(Z)V

    .line 82
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "video"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/VideoFile;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mVideo:Lcom/vkontakte/android/api/VideoFile;

    .line 83
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v2, 0x0

    .line 141
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/ContainerFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 142
    const v0, 0x7f10001a

    const v1, 0x7f0801c5

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mDoneItem:Landroid/view/MenuItem;

    .line 143
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mDoneItem:Landroid/view/MenuItem;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020184

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mDoneDrawable:Landroid/graphics/drawable/Drawable;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    move-result-object v0

    const/4 v1, 0x2

    .line 144
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 145
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mDoneItem:Landroid/view/MenuItem;

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mDoneEnabled:Z

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 146
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mDoneDrawable:Landroid/graphics/drawable/Drawable;

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mDoneEnabled:Z

    if-eqz v0, :cond_0

    const/16 v0, 0xff

    :goto_0
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 148
    return-void

    .line 146
    :cond_0
    const/16 v0, 0x7f

    goto :goto_0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 88
    const v0, 0x7f030225

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method onDone()V
    .locals 6

    .prologue
    .line 241
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mTitle:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 242
    .local v2, "title":Ljava/lang/String;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mSubtitle:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 243
    .local v3, "description":Ljava/lang/String;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mVideo:Lcom/vkontakte/android/api/VideoFile;

    if-eqz v0, :cond_0

    .line 244
    new-instance v0, Lcom/vkontakte/android/api/video/VideoEdit;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mVideo:Lcom/vkontakte/android/api/VideoFile;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacy:Lcom/vkontakte/android/data/PrivacySetting;

    invoke-virtual {v4}, Lcom/vkontakte/android/data/PrivacySetting;->getApiValue()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacyComment:Lcom/vkontakte/android/data/PrivacySetting;

    invoke-virtual {v5}, Lcom/vkontakte/android/data/PrivacySetting;->getApiValue()Ljava/lang/String;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/video/VideoEdit;-><init>(Lcom/vkontakte/android/api/VideoFile;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment$1;

    .line 245
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v1, p0, v4, v2, v3}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment$1;-><init>(Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/video/VideoEdit;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 258
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 260
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 152
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f10001a

    if-ne v0, v1, :cond_0

    .line 153
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->onDone()V

    .line 155
    :cond_0
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/ContainerFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 180
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 10
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 93
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/ContainerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 94
    const v2, 0x7f0801dd

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->setTitle(I)V

    .line 95
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v2

    const v3, 0x7f0202c5

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 96
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v3

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    check-cast v2, Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v2}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    const v2, 0x7f100577

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mContainer:Landroid/view/ViewGroup;

    .line 100
    const v2, 0x7f100128

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mTitle:Landroid/widget/EditText;

    .line 101
    const v2, 0x7f10019c

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mSubtitle:Landroid/widget/EditText;

    .line 102
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mTitle:Landroid/widget/EditText;

    invoke-virtual {v2, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 104
    const v2, 0x7f100579

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacyValue:Landroid/widget/TextView;

    .line 105
    const v2, 0x7f10057e

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacyCommentValue:Landroid/widget/TextView;

    .line 107
    const v2, 0x7f1002cb

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 109
    .local v0, "privacy":Landroid/view/View;
    const v2, 0x7f10057c

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 110
    .local v1, "privacyComment":Landroid/view/View;
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 113
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mVideo:Lcom/vkontakte/android/api/VideoFile;

    if-eqz v2, :cond_0

    .line 114
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mTitle:Landroid/widget/EditText;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mVideo:Lcom/vkontakte/android/api/VideoFile;

    iget-object v3, v3, Lcom/vkontakte/android/api/VideoFile;->title:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 115
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mTitle:Landroid/widget/EditText;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mTitle:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setSelection(I)V

    .line 116
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mSubtitle:Landroid/widget/EditText;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mVideo:Lcom/vkontakte/android/api/VideoFile;

    iget-object v3, v3, Lcom/vkontakte/android/api/VideoFile;->descr:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 117
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mSubtitle:Landroid/widget/EditText;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mSubtitle:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setSelection(I)V

    .line 119
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mVideo:Lcom/vkontakte/android/api/VideoFile;

    iget v2, v2, Lcom/vkontakte/android/api/VideoFile;->oid:I

    if-gez v2, :cond_0

    .line 120
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 121
    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 125
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacy:Lcom/vkontakte/android/data/PrivacySetting;

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/String;

    const-string/jumbo v4, "all"

    aput-object v4, v3, v5

    const-string/jumbo v4, "friends"

    aput-object v4, v3, v6

    const-string/jumbo v4, "friends_of_friends"

    aput-object v4, v3, v7

    const-string/jumbo v4, "only_me"

    aput-object v4, v3, v8

    const-string/jumbo v4, "some"

    aput-object v4, v3, v9

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    iput-object v3, v2, Lcom/vkontakte/android/data/PrivacySetting;->possibleRules:Ljava/util/List;

    .line 126
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacy:Lcom/vkontakte/android/data/PrivacySetting;

    const v3, 0x7f0801de

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/vkontakte/android/data/PrivacySetting;->title:Ljava/lang/String;

    .line 127
    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacy:Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mVideo:Lcom/vkontakte/android/api/VideoFile;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mVideo:Lcom/vkontakte/android/api/VideoFile;

    iget-object v2, v2, Lcom/vkontakte/android/api/VideoFile;->privacy:Ljava/util/List;

    :goto_0
    iput-object v2, v3, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    .line 128
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacyValue:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacy:Lcom/vkontakte/android/data/PrivacySetting;

    invoke-virtual {v3}, Lcom/vkontakte/android/data/PrivacySetting;->getDisplayString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacyComment:Lcom/vkontakte/android/data/PrivacySetting;

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/String;

    const-string/jumbo v4, "all"

    aput-object v4, v3, v5

    const-string/jumbo v4, "friends"

    aput-object v4, v3, v6

    const-string/jumbo v4, "friends_of_friends"

    aput-object v4, v3, v7

    const-string/jumbo v4, "only_me"

    aput-object v4, v3, v8

    const-string/jumbo v4, "some"

    aput-object v4, v3, v9

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    iput-object v3, v2, Lcom/vkontakte/android/data/PrivacySetting;->possibleRules:Ljava/util/List;

    .line 131
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacyComment:Lcom/vkontakte/android/data/PrivacySetting;

    const v3, 0x7f0801df

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/vkontakte/android/data/PrivacySetting;->title:Ljava/lang/String;

    .line 132
    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacyComment:Lcom/vkontakte/android/data/PrivacySetting;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mVideo:Lcom/vkontakte/android/api/VideoFile;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mVideo:Lcom/vkontakte/android/api/VideoFile;

    iget-object v2, v2, Lcom/vkontakte/android/api/VideoFile;->privacyComment:Ljava/util/List;

    :goto_1
    iput-object v2, v3, Lcom/vkontakte/android/data/PrivacySetting;->value:Ljava/util/List;

    .line 133
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacyCommentValue:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mPrivacyComment:Lcom/vkontakte/android/data/PrivacySetting;

    invoke-virtual {v3}, Lcom/vkontakte/android/data/PrivacySetting;->getDisplayString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->updateDecorator()V

    .line 136
    return-void

    .line 127
    :cond_1
    new-array v2, v6, [Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;

    sget-object v4, Lcom/vkontakte/android/data/PrivacySetting;->ALL:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    aput-object v4, v2, v5

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    goto :goto_0

    .line 132
    :cond_2
    new-array v2, v6, [Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;

    sget-object v4, Lcom/vkontakte/android/data/PrivacySetting;->ALL:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    aput-object v4, v2, v5

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    goto :goto_1
.end method

.method updateDecorator()V
    .locals 9

    .prologue
    const/4 v5, 0x0

    .line 219
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mContainer:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-ge v2, v4, :cond_1

    .line 220
    new-instance v0, Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const/4 v7, -0x1

    const/high16 v4, 0x40000000    # 2.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    int-to-float v8, v4

    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->isTablet:Z

    if-nez v4, :cond_0

    const/4 v4, 0x1

    :goto_1
    invoke-direct {v0, v6, v7, v8, v4}, Lcom/vkontakte/android/ui/cardview/CardDrawable;-><init>(Landroid/content/res/Resources;IFZ)V

    .line 221
    .local v0, "bg":Landroid/graphics/drawable/Drawable;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mContainer:Landroid/view/ViewGroup;

    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 222
    .local v1, "c":Landroid/view/View;
    invoke-static {v1, v0}, Lcom/vkontakte/android/ViewUtils;->setBackgroundWithViewPadding(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 219
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v0    # "bg":Landroid/graphics/drawable/Drawable;
    .end local v1    # "c":Landroid/view/View;
    :cond_0
    move v4, v5

    .line 220
    goto :goto_1

    .line 224
    :cond_1
    iget v4, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->scrW:I

    const/16 v6, 0x39c

    if-lt v4, v6, :cond_2

    const/high16 v4, 0x42000000    # 32.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    .line 225
    .local v3, "pad":I
    :goto_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/VideoEditorFragment;->mContainer:Landroid/view/ViewGroup;

    invoke-virtual {v4, v3, v5, v3, v5}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 226
    return-void

    .end local v3    # "pad":I
    :cond_2
    move v3, v5

    .line 224
    goto :goto_2
.end method
