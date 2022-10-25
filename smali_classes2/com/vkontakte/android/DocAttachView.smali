.class public Lcom/vkontakte/android/DocAttachView;
.super Landroid/widget/LinearLayout;
.source "DocAttachView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field private doc:Lcom/vkontakte/android/attachments/DocumentAttachment;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 32
    invoke-virtual {p0, p0}, Lcom/vkontakte/android/DocAttachView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 33
    invoke-virtual {p0, p0}, Lcom/vkontakte/android/DocAttachView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 34
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 63
    iget-object v3, p0, Lcom/vkontakte/android/DocAttachView;->doc:Lcom/vkontakte/android/attachments/DocumentAttachment;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/vkontakte/android/DocAttachView;->doc:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/DocumentAttachment;->extension:Ljava/lang/String;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/vkontakte/android/DocAttachView;->doc:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/DocumentAttachment;->extension:Ljava/lang/String;

    const-string/jumbo v4, "gif"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 64
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/DocAttachView;->doc:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v3, v4}, Lcom/vkontakte/android/gifs/GifViewer;->start(Landroid/app/Activity;Lcom/vkontakte/android/attachments/DocumentAttachment;)V

    .line 81
    :cond_0
    :goto_0
    return-void

    .line 66
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/DocAttachView;->doc:Lcom/vkontakte/android/attachments/DocumentAttachment;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/vkontakte/android/DocAttachView;->doc:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/DocumentAttachment;->url:Ljava/lang/String;

    const-string/jumbo v4, "http"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 69
    iget-object v3, p0, Lcom/vkontakte/android/DocAttachView;->doc:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/DocumentAttachment;->thumb:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 70
    new-instance v3, Lcom/vkontakte/android/PhotoViewer;

    invoke-virtual {p0}, Lcom/vkontakte/android/DocAttachView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/DocAttachView;->doc:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-object v5, v5, Lcom/vkontakte/android/attachments/DocumentAttachment;->url:Ljava/lang/String;

    iget-object v6, p0, Lcom/vkontakte/android/DocAttachView;->doc:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-object v6, v6, Lcom/vkontakte/android/attachments/DocumentAttachment;->title:Ljava/lang/String;

    invoke-direct {v3, v4, v5, v6}, Lcom/vkontakte/android/PhotoViewer;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/vkontakte/android/PhotoViewer;->show()V

    goto :goto_0

    .line 72
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/DocAttachView;->doc:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/DocumentAttachment;->url:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 73
    .local v2, "uri":Landroid/net/Uri;
    new-instance v1, Landroid/app/DownloadManager$Request;

    invoke-direct {v1, v2}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    .line 74
    .local v1, "req":Landroid/app/DownloadManager$Request;
    new-instance v3, Ljava/io/File;

    sget-object v4, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-static {v4}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v2}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/app/DownloadManager$Request;->setDestinationUri(Landroid/net/Uri;)Landroid/app/DownloadManager$Request;

    .line 75
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    .line 76
    invoke-virtual {v1}, Landroid/app/DownloadManager$Request;->allowScanningByMediaScanner()V

    .line 77
    invoke-virtual {p0}, Lcom/vkontakte/android/DocAttachView;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string/jumbo v4, "download"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/DownloadManager;

    .line 78
    .local v0, "mgr":Landroid/app/DownloadManager;
    invoke-virtual {v0, v1}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J

    goto :goto_0
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 89
    iget-object v1, p0, Lcom/vkontakte/android/DocAttachView;->doc:Lcom/vkontakte/android/attachments/DocumentAttachment;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/DocAttachView;->doc:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/DocumentAttachment;->extension:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/DocAttachView;->doc:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/DocumentAttachment;->extension:Ljava/lang/String;

    const-string/jumbo v2, "gif"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 90
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    iget-object v2, p0, Lcom/vkontakte/android/DocAttachView;->doc:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-object v2, v2, Lcom/vkontakte/android/attachments/DocumentAttachment;->url:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 91
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/vkontakte/android/DocAttachView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 92
    const/4 v1, 0x1

    .line 94
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onMeasure(II)V
    .locals 2
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 55
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/DocAttachView;->doc:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment;->thumb:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 57
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    invoke-virtual {p0}, Lcom/vkontakte/android/DocAttachView;->getMeasuredHeight()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/DocAttachView;->setMeasuredDimension(II)V

    .line 59
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 0

    .prologue
    .line 85
    return-void
.end method

.method public setData(Lcom/vkontakte/android/attachments/DocumentAttachment;)V
    .locals 8
    .param p1, "doc"    # Lcom/vkontakte/android/attachments/DocumentAttachment;

    .prologue
    const/4 v7, 0x0

    const v6, 0x7f1001e2

    const/high16 v5, 0x43160000    # 150.0f

    .line 37
    iput-object p1, p0, Lcom/vkontakte/android/DocAttachView;->doc:Lcom/vkontakte/android/attachments/DocumentAttachment;

    .line 38
    const-string/jumbo v2, "gif"

    iget-object v3, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->extension:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {}, Lcom/vkontakte/android/cache/Gifs;->allowAutoPlay()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 39
    invoke-virtual {p0, v6}, Lcom/vkontakte/android/DocAttachView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->extension:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    :goto_0
    iget-object v2, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->url:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 47
    invoke-virtual {p0, v7}, Lcom/vkontakte/android/DocAttachView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    invoke-virtual {p0, v7}, Lcom/vkontakte/android/DocAttachView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 49
    const/4 v2, -0x1

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/DocAttachView;->setBackgroundColor(I)V

    .line 50
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/DocAttachView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 52
    :cond_0
    return-void

    .line 41
    :cond_1
    iget v2, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->size:I

    int-to-long v2, v2

    invoke-virtual {p0}, Lcom/vkontakte/android/DocAttachView;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/vkontakte/android/Global;->langFileSize(JLandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v0

    .line 42
    .local v0, "size":Ljava/lang/String;
    iget-object v2, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->extension:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    move-object v1, v0

    .line 43
    .local v1, "text":Ljava/lang/String;
    :goto_1
    invoke-virtual {p0, v6}, Lcom/vkontakte/android/DocAttachView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 42
    .end local v1    # "text":Ljava/lang/String;
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p1, Lcom/vkontakte/android/attachments/DocumentAttachment;->extension:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method
