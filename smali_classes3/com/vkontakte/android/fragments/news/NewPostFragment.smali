.class public Lcom/vkontakte/android/fragments/news/NewPostFragment;
.super Lme/grishka/appkit/fragments/ContainerFragment;
.source "NewPostFragment.java"

# interfaces
.implements Lcom/vkontakte/android/fragments/BackListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;,
        Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    }
.end annotation


# static fields
.field public static final POLL_EDIT_RESULT:I = 0x9


# instance fields
.field attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

.field bottomBar:Landroid/view/View;

.field divider:Landroid/view/View;

.field locationBar:Landroid/view/View;

.field mAttachments:[Landroid/os/Parcelable;

.field mCamera:Z

.field mClipboardManager:Landroid/content/ClipboardManager;

.field mEdit:Lcom/vkontakte/android/NewsEntry;

.field mFbIcon:Landroid/view/View;

.field mForbidAttachmentsEdit:Z

.field mFriendsOnlyIcon:Landroid/view/View;

.field mGroupPhoto:Ljava/lang/String;

.field mGroupTitle:Ljava/lang/String;

.field mLocation:Landroid/widget/ImageView;

.field mLocationAddress:Landroid/widget/TextView;

.field mPhotos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final mPresenter:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

.field mPublic:Z

.field mSendAction:Z

.field mSendEnabled:Z

.field mSendIcon:Landroid/graphics/drawable/Drawable;

.field mSendItem:Landroid/view/MenuItem;

.field mSendText:I

.field mSettings:Landroid/view/View;

.field mSignatureText:Landroid/widget/TextView;

.field mStatusEdit:Landroid/widget/EditText;

.field mSuggest:Z

.field mTwitterIcon:Landroid/view/View;

.field optionsAlertView:Landroid/widget/ListView;

.field photoURI:Landroid/net/Uri;

.field text:Ljava/lang/String;

.field uid:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 108
    invoke-direct {p0}, Lme/grishka/appkit/fragments/ContainerFragment;-><init>()V

    .line 222
    new-instance v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;-><init>(Lcom/vkontakte/android/fragments/news/NewPostFragment;Lcom/vkontakte/android/fragments/news/NewPostFragment$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPresenter:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    .line 236
    const v0, 0x7f0805f7

    iput v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendText:I

    .line 254
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/news/NewPostFragment;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/news/NewPostFragment;
    .param p1, "x1"    # I

    .prologue
    .line 108
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->setTitle(I)V

    return-void
.end method


# virtual methods
.method synthetic lambda$showKeyboard$0(Landroid/view/inputmethod/InputMethodManager;)V
    .locals 2
    .param p1, "imm"    # Landroid/view/inputmethod/InputMethodManager;

    .prologue
    .line 375
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 368
    invoke-super {p0, p1, p2, p3}, Lme/grishka/appkit/fragments/ContainerFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 369
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPresenter:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->onActivityResult(IILandroid/content/Intent;)V

    .line 370
    return-void
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 363
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPresenter:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->onBackPressed()Z

    move-result v0

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 262
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/ContainerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 263
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->setHasOptionsMenu(Z)V

    .line 264
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string/jumbo v1, "clipboard"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mClipboardManager:Landroid/content/ClipboardManager;

    .line 265
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "edit"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    .line 266
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "suggest"

    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSuggest:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSuggest:Z

    .line 267
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "public"

    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPublic:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPublic:Z

    .line 268
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "send_action"

    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendAction:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendAction:Z

    .line 269
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "group_title"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mGroupTitle:Ljava/lang/String;

    .line 270
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "group_photo"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mGroupPhoto:Ljava/lang/String;

    .line 271
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "camera"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mCamera:Z

    .line 272
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "uid"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    .line 273
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "text"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->text:Ljava/lang/String;

    .line 274
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "photoURI"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->photoURI:Landroid/net/Uri;

    .line 275
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "photos"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPhotos:Ljava/util/ArrayList;

    .line 276
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "attachments"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mAttachments:[Landroid/os/Parcelable;

    .line 277
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "forbid_attach_edit"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mForbidAttachmentsEdit:Z

    .line 278
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v2, 0x0

    .line 336
    const v0, 0x7f10001a

    iget v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendText:I

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendItem:Landroid/view/MenuItem;

    .line 337
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020184

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendIcon:Landroid/graphics/drawable/Drawable;

    .line 338
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendItem:Landroid/view/MenuItem;

    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 339
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendItem:Landroid/view/MenuItem;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendIcon:Landroid/graphics/drawable/Drawable;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    .line 341
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendItem:Landroid/view/MenuItem;

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendEnabled:Z

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 342
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendIcon:Landroid/graphics/drawable/Drawable;

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendEnabled:Z

    if-eqz v0, :cond_0

    const/16 v0, 0xff

    :goto_0
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 343
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendItem:Landroid/view/MenuItem;

    iget v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendText:I

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 344
    return-void

    .line 342
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
    .line 283
    const v0, 0x7f03021a

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 349
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f10001a

    if-ne v0, v1, :cond_0

    .line 350
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPresenter:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->send()V

    .line 352
    :cond_0
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/ContainerFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 357
    invoke-super {p0}, Lme/grishka/appkit/fragments/ContainerFragment;->onResume()V

    .line 358
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->showKeyboard()V

    .line 359
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const v3, 0x7f100576

    const v2, 0x7f100572

    .line 288
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/ContainerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 289
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSuggest:Z

    if-eqz v0, :cond_0

    .line 290
    const v0, 0x7f080580

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->setTitle(I)V

    .line 296
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const v1, 0x7f0202c5

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 297
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 299
    const v0, 0x7f10056a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    .line 300
    const v0, 0x7f100570

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mFbIcon:Landroid/view/View;

    .line 301
    const v0, 0x7f10056f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mTwitterIcon:Landroid/view/View;

    .line 302
    const v0, 0x7f10056e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mFriendsOnlyIcon:Landroid/view/View;

    .line 303
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mLocation:Landroid/widget/ImageView;

    .line 304
    const v0, 0x7f10056d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mLocationAddress:Landroid/widget/TextView;

    .line 305
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSettings:Landroid/view/View;

    .line 306
    const v0, 0x7f1001dc

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSignatureText:Landroid/widget/TextView;

    .line 308
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPresenter:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 309
    const v0, 0x7f100574

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPresenter:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 310
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPresenter:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 311
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPresenter:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 312
    const v0, 0x7f100573

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPresenter:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 313
    const v0, 0x7f100575

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPresenter:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 314
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mLocation:Landroid/widget/ImageView;

    new-instance v1, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mLocation:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0f0123

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 316
    const v0, 0x7f10056b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/AttachmentsEditorView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    .line 317
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mForbidAttachmentsEdit:Z

    iput-boolean v1, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->forbidAttachmentsEdit:Z

    .line 318
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->isWallPhoto:Z

    .line 319
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    iget v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    iput v1, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView;->uploadOwnerId:I

    .line 320
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPresenter:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->setCallback(Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;)V

    .line 322
    const v0, 0x7f10056c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->locationBar:Landroid/view/View;

    .line 323
    const v0, 0x7f1001cb

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->divider:Landroid/view/View;

    .line 324
    const v0, 0x7f100571

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->bottomBar:Landroid/view/View;

    .line 327
    const v0, 0x7f100568

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->setNoClipRecursive(Landroid/view/View;)V

    .line 328
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mLocationAddress:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 329
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->showKeyboard()V

    .line 331
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPresenter:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->setupInitialData()V

    .line 332
    return-void

    .line 291
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    if-eqz v0, :cond_1

    .line 292
    const v0, 0x7f08050c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->setTitle(I)V

    goto/16 :goto_0

    .line 294
    :cond_1
    const v0, 0x7f080426

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->setTitle(I)V

    goto/16 :goto_0
.end method

.method showKeyboard()V
    .locals 6

    .prologue
    .line 373
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 374
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {v0}, Landroid/view/inputmethod/InputMethodManager;->isAcceptingText()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 375
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    invoke-static {p0, v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment;Landroid/view/inputmethod/InputMethodManager;)Ljava/lang/Runnable;

    move-result-object v2

    const-wide/16 v4, 0xc8

    invoke-virtual {v1, v2, v4, v5}, Landroid/widget/EditText;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 377
    :cond_0
    return-void
.end method
