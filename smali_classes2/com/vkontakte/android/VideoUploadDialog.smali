.class public final Lcom/vkontakte/android/VideoUploadDialog;
.super Landroid/support/v7/app/AppCompatActivity;
.source "VideoUploadDialog.java"


# static fields
.field private static final EXTRA_OWNER_ID:Ljava/lang/String; = "ownerId"

.field private static final EXTRA_VIDEO_URI:Ljava/lang/String; = "videoUri"

.field private static final KEY_DESC:Ljava/lang/String; = "desc"

.field private static final KEY_TITLE:Ljava/lang/String; = "title"

.field public static final TAG:Ljava/lang/String;

.field private static final URI_VIDEOS:Ljava/lang/String; = "vkontakte://vk.com/videos"


# instance fields
.field descInputView:Landroid/widget/EditText;

.field titleInputView:Landroid/widget/EditText;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const-class v0, Lcom/vkontakte/android/VideoUploadDialog;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/VideoUploadDialog;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method static synthetic lambda$onCreate$2(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .prologue
    .line 94
    return-void
.end method

.method public static show(Landroid/content/Context;ILandroid/net/Uri;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "ownerId"    # I
    .param p2, "videoUri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 44
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vkontakte/android/VideoUploadDialog;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 45
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "ownerId"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 46
    const-string/jumbo v1, "videoUri"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 47
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 48
    return-void
.end method

.method private startUploading()V
    .locals 10

    .prologue
    const/4 v6, 0x0

    .line 119
    invoke-virtual {p0}, Lcom/vkontakte/android/VideoUploadDialog;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "ownerId"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    .line 120
    .local v7, "ownerID":I
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "vkontakte://vk.com/videos"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-static {p0, v6, v1, v6}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v9

    .line 121
    .local v9, "intent":Landroid/app/PendingIntent;
    new-instance v0, Lcom/vkontakte/android/upload/VideoUploadTask;

    .line 123
    invoke-virtual {p0}, Lcom/vkontakte/android/VideoUploadDialog;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "videoUri"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v1, p0, Lcom/vkontakte/android/VideoUploadDialog;->titleInputView:Landroid/widget/EditText;

    .line 124
    invoke-static {v1}, Lcom/vkontakte/android/VideoUploadDialog;->val(Landroid/widget/EditText;)Ljava/lang/String;

    move-result-object v3

    iget-object v1, p0, Lcom/vkontakte/android/VideoUploadDialog;->descInputView:Landroid/widget/EditText;

    .line 125
    invoke-static {v1}, Lcom/vkontakte/android/VideoUploadDialog;->val(Landroid/widget/EditText;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/vkontakte/android/media/video/VideoEncoderSettings;->p720:Lcom/vkontakte/android/media/video/VideoEncoderSettings;

    const/4 v8, 0x1

    move-object v1, p0

    invoke-direct/range {v0 .. v8}, Lcom/vkontakte/android/upload/VideoUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/media/video/VideoEncoderSettings;ZIZ)V

    .line 131
    .local v0, "task":Lcom/vkontakte/android/upload/VideoUploadTask;
    const v1, 0x7f080769

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/VideoUploadDialog;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f08076a

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/VideoUploadDialog;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2, v9}, Lcom/vkontakte/android/upload/VideoUploadTask;->setDoneNotification(Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)V

    .line 132
    invoke-static {p0, v0}, Lcom/vkontakte/android/upload/Upload;->start(Landroid/content/Context;Lcom/vkontakte/android/upload/UploadTask;)V

    .line 133
    return-void
.end method

.method private static val(Landroid/widget/EditText;)Ljava/lang/String;
    .locals 1
    .param p0, "input"    # Landroid/widget/EditText;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 137
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static val(Landroid/widget/EditText;Ljava/lang/String;)V
    .locals 0
    .param p0, "input"    # Landroid/widget/EditText;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "value"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 141
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 142
    return-void
.end method


# virtual methods
.method public finish()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 100
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->finish()V

    .line 101
    invoke-virtual {p0, v0, v0}, Lcom/vkontakte/android/VideoUploadDialog;->overridePendingTransition(II)V

    .line 102
    return-void
.end method

.method synthetic lambda$onCreate$0(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 92
    invoke-virtual {p0}, Lcom/vkontakte/android/VideoUploadDialog;->finish()V

    return-void
.end method

.method synthetic lambda$onCreate$1(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 93
    invoke-direct {p0}, Lcom/vkontakte/android/VideoUploadDialog;->startUploading()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 12
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v11, -0x1

    const/4 v10, -0x2

    const/high16 v9, 0x41800000    # 16.0f

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 54
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 55
    invoke-virtual {p0, v7, v7}, Lcom/vkontakte/android/VideoUploadDialog;->overridePendingTransition(II)V

    .line 57
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 58
    .local v4, "titleView":Landroid/widget/TextView;
    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 59
    const v5, 0x7f080669

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    .line 60
    const/high16 v5, 0x41a00000    # 20.0f

    invoke-virtual {v4, v8, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 61
    sget-object v5, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v5, v5, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 62
    const v5, 0x7f0f0060

    invoke-static {p0, v5}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 63
    const/16 v5, 0x18

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v2

    .line 64
    .local v2, "pad":I
    invoke-virtual {v4, v2, v2, v2, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 66
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 67
    .local v1, "contentView":Landroid/widget/LinearLayout;
    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 68
    const/16 v5, 0x14

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v5

    invoke-virtual {v1, v2, v5, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 70
    new-instance v5, Landroid/widget/EditText;

    invoke-direct {v5, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/vkontakte/android/VideoUploadDialog;->titleInputView:Landroid/widget/EditText;

    .line 71
    iget-object v5, p0, Lcom/vkontakte/android/VideoUploadDialog;->titleInputView:Landroid/widget/EditText;

    sget-object v6, Lcom/vkontakte/android/ui/Font;->Regular:Lcom/vkontakte/android/ui/Font;

    iget-object v6, v6, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 72
    iget-object v5, p0, Lcom/vkontakte/android/VideoUploadDialog;->titleInputView:Landroid/widget/EditText;

    invoke-virtual {v5, v7}, Landroid/widget/EditText;->setIncludeFontPadding(Z)V

    .line 73
    iget-object v5, p0, Lcom/vkontakte/android/VideoUploadDialog;->titleInputView:Landroid/widget/EditText;

    const v6, 0x7f080668

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setHint(I)V

    .line 74
    iget-object v5, p0, Lcom/vkontakte/android/VideoUploadDialog;->titleInputView:Landroid/widget/EditText;

    invoke-virtual {v5, v8}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 75
    iget-object v5, p0, Lcom/vkontakte/android/VideoUploadDialog;->titleInputView:Landroid/widget/EditText;

    invoke-virtual {v5, v8, v9}, Landroid/widget/EditText;->setTextSize(IF)V

    .line 76
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v11, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 77
    .local v3, "params":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v5, 0x8

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v5

    iput v5, v3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 78
    iget-object v5, p0, Lcom/vkontakte/android/VideoUploadDialog;->titleInputView:Landroid/widget/EditText;

    invoke-virtual {v1, v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    new-instance v5, Landroid/widget/EditText;

    invoke-direct {v5, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/vkontakte/android/VideoUploadDialog;->descInputView:Landroid/widget/EditText;

    .line 81
    iget-object v5, p0, Lcom/vkontakte/android/VideoUploadDialog;->descInputView:Landroid/widget/EditText;

    sget-object v6, Lcom/vkontakte/android/ui/Font;->Regular:Lcom/vkontakte/android/ui/Font;

    iget-object v6, v6, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 82
    iget-object v5, p0, Lcom/vkontakte/android/VideoUploadDialog;->descInputView:Landroid/widget/EditText;

    invoke-virtual {v5, v7}, Landroid/widget/EditText;->setIncludeFontPadding(Z)V

    .line 83
    iget-object v5, p0, Lcom/vkontakte/android/VideoUploadDialog;->descInputView:Landroid/widget/EditText;

    const v6, 0x7f080667

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setHint(I)V

    .line 84
    iget-object v5, p0, Lcom/vkontakte/android/VideoUploadDialog;->descInputView:Landroid/widget/EditText;

    const/4 v6, 0x4

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 85
    iget-object v5, p0, Lcom/vkontakte/android/VideoUploadDialog;->descInputView:Landroid/widget/EditText;

    invoke-virtual {v5, v8, v9}, Landroid/widget/EditText;->setTextSize(IF)V

    .line 86
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .end local v3    # "params":Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct {v3, v11, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 87
    .restart local v3    # "params":Landroid/widget/LinearLayout$LayoutParams;
    iget-object v5, p0, Lcom/vkontakte/android/VideoUploadDialog;->descInputView:Landroid/widget/EditText;

    invoke-virtual {v1, v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    new-instance v0, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 90
    .local v0, "builder":Landroid/support/v7/app/AlertDialog$Builder;
    invoke-virtual {v0, v4}, Landroid/support/v7/app/AlertDialog$Builder;->setCustomTitle(Landroid/view/View;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 91
    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 92
    invoke-static {p0}, Lcom/vkontakte/android/VideoUploadDialog$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/VideoUploadDialog;)Landroid/content/DialogInterface$OnDismissListener;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/support/v7/app/AlertDialog$Builder;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 93
    const v5, 0x7f080479

    invoke-static {p0}, Lcom/vkontakte/android/VideoUploadDialog$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/VideoUploadDialog;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 94
    const v5, 0x7f08011f

    invoke-static {}, Lcom/vkontakte/android/VideoUploadDialog$$Lambda$3;->lambdaFactory$()Landroid/content/DialogInterface$OnClickListener;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Landroid/support/v7/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 95
    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog$Builder;->show()Landroid/support/v7/app/AlertDialog;

    .line 96
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 113
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 114
    iget-object v0, p0, Lcom/vkontakte/android/VideoUploadDialog;->titleInputView:Landroid/widget/EditText;

    const-string/jumbo v1, "title"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/VideoUploadDialog;->val(Landroid/widget/EditText;Ljava/lang/String;)V

    .line 115
    iget-object v0, p0, Lcom/vkontakte/android/VideoUploadDialog;->descInputView:Landroid/widget/EditText;

    const-string/jumbo v1, "desc"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/VideoUploadDialog;->val(Landroid/widget/EditText;Ljava/lang/String;)V

    .line 116
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 106
    const-string/jumbo v0, "title"

    iget-object v1, p0, Lcom/vkontakte/android/VideoUploadDialog;->titleInputView:Landroid/widget/EditText;

    invoke-static {v1}, Lcom/vkontakte/android/VideoUploadDialog;->val(Landroid/widget/EditText;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    const-string/jumbo v0, "desc"

    iget-object v1, p0, Lcom/vkontakte/android/VideoUploadDialog;->descInputView:Landroid/widget/EditText;

    invoke-static {v1}, Lcom/vkontakte/android/VideoUploadDialog;->val(Landroid/widget/EditText;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 109
    return-void
.end method
