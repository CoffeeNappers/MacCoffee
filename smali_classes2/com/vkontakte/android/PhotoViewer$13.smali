.class Lcom/vkontakte/android/PhotoViewer$13;
.super Ljava/lang/Object;
.source "PhotoViewer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/PhotoViewer;->setBottomBarData(IIIIZLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/PhotoViewer;

.field final synthetic val$comments:I

.field final synthetic val$descr:Ljava/lang/String;

.field final synthetic val$liked:Z

.field final synthetic val$likes:I

.field final synthetic val$reposts:I

.field final synthetic val$tags:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/PhotoViewer;Ljava/lang/String;ZIIII)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 740
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$13;->this$0:Lcom/vkontakte/android/PhotoViewer;

    iput-object p2, p0, Lcom/vkontakte/android/PhotoViewer$13;->val$descr:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/vkontakte/android/PhotoViewer$13;->val$liked:Z

    iput p4, p0, Lcom/vkontakte/android/PhotoViewer$13;->val$likes:I

    iput p5, p0, Lcom/vkontakte/android/PhotoViewer$13;->val$comments:I

    iput p6, p0, Lcom/vkontakte/android/PhotoViewer$13;->val$tags:I

    iput p7, p0, Lcom/vkontakte/android/PhotoViewer$13;->val$reposts:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/16 v1, 0x8

    const/4 v2, 0x0

    .line 743
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$13;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$1900(Lcom/vkontakte/android/PhotoViewer;)Landroid/widget/TextView;

    move-result-object v3

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$13;->val$descr:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 744
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$13;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$1900(Lcom/vkontakte/android/PhotoViewer;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer$13;->val$descr:Ljava/lang/String;

    invoke-static {v3}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/vkontakte/android/LinkParser;->truncatePost(Ljava/lang/CharSequence;Z)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 745
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$13;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$2000(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/ui/OverlayTextView;

    move-result-object v0

    iget-boolean v3, p0, Lcom/vkontakte/android/PhotoViewer$13;->val$liked:Z

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/ui/OverlayTextView;->setSelected(Z)V

    .line 746
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$13;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$2000(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/ui/OverlayTextView;

    move-result-object v3

    iget v0, p0, Lcom/vkontakte/android/PhotoViewer$13;->val$likes:I

    if-lez v0, :cond_1

    iget v0, p0, Lcom/vkontakte/android/PhotoViewer$13;->val$likes:I

    invoke-static {v0}, Lcom/vkontakte/android/Global;->formatNumber(I)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {v3, v0}, Lcom/vkontakte/android/ui/OverlayTextView;->setText(Ljava/lang/CharSequence;)V

    .line 747
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$13;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$2100(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/ui/OverlayTextView;

    move-result-object v3

    iget v0, p0, Lcom/vkontakte/android/PhotoViewer$13;->val$comments:I

    if-lez v0, :cond_2

    iget v0, p0, Lcom/vkontakte/android/PhotoViewer$13;->val$comments:I

    invoke-static {v0}, Lcom/vkontakte/android/Global;->formatNumber(I)Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-virtual {v3, v0}, Lcom/vkontakte/android/ui/OverlayTextView;->setText(Ljava/lang/CharSequence;)V

    .line 748
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$13;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$2200(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/ui/OverlayTextView;

    move-result-object v0

    iget v3, p0, Lcom/vkontakte/android/PhotoViewer$13;->val$tags:I

    invoke-static {v3}, Lcom/vkontakte/android/Global;->formatNumber(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/ui/OverlayTextView;->setText(Ljava/lang/CharSequence;)V

    .line 749
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$13;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$2200(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/ui/OverlayTextView;

    move-result-object v0

    iget v3, p0, Lcom/vkontakte/android/PhotoViewer$13;->val$tags:I

    if-lez v3, :cond_3

    :goto_3
    invoke-virtual {v0, v2}, Lcom/vkontakte/android/ui/OverlayTextView;->setVisibility(I)V

    .line 750
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$13;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$2300(Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/ui/OverlayTextView;

    move-result-object v1

    iget v0, p0, Lcom/vkontakte/android/PhotoViewer$13;->val$reposts:I

    if-lez v0, :cond_4

    iget v0, p0, Lcom/vkontakte/android/PhotoViewer$13;->val$reposts:I

    invoke-static {v0}, Lcom/vkontakte/android/Global;->formatNumber(I)Ljava/lang/String;

    move-result-object v0

    :goto_4
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/ui/OverlayTextView;->setText(Ljava/lang/CharSequence;)V

    .line 751
    return-void

    :cond_0
    move v0, v2

    .line 743
    goto :goto_0

    .line 746
    :cond_1
    const-string/jumbo v0, ""

    goto :goto_1

    .line 747
    :cond_2
    const-string/jumbo v0, ""

    goto :goto_2

    :cond_3
    move v2, v1

    .line 749
    goto :goto_3

    .line 750
    :cond_4
    const-string/jumbo v0, ""

    goto :goto_4
.end method
