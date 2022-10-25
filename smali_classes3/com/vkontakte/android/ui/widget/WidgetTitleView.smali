.class public Lcom/vkontakte/android/ui/widget/WidgetTitleView;
.super Lcom/vkontakte/android/ui/widget/WidgetView;
.source "WidgetTitleView.java"


# instance fields
.field private final moreView:Landroid/widget/TextView;

.field private final titleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/widget/WidgetTitleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 28
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/widget/WidgetTitleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 32
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/widget/WidgetView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 33
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WidgetTitleView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0301e5

    invoke-static {v1, v2, p0}, Lcom/vkontakte/android/ui/widget/WidgetTitleView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 34
    .local v0, "widgetView":Landroid/view/View;
    const v1, 0x7f100128

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetTitleView;->titleView:Landroid/widget/TextView;

    .line 35
    const v1, 0x7f1002ad

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetTitleView;->moreView:Landroid/widget/TextView;

    .line 36
    return-void
.end method

.method protected static openLink(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 65
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vkontakte/android/LinkRedirActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 66
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 67
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 68
    return-void
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/api/widget/Widget;)V
    .locals 7
    .param p1, "widget"    # Lcom/vkontakte/android/api/widget/Widget;

    .prologue
    .line 40
    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/Widget;->getMore()Ljava/lang/String;

    move-result-object v0

    .line 43
    .local v0, "more":Ljava/lang/CharSequence;
    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/Widget;->getTitleCounter()Ljava/lang/Integer;

    move-result-object v4

    if-nez v4, :cond_2

    .line 44
    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/Widget;->getTitle()Ljava/lang/String;

    move-result-object v2

    .line 50
    .local v2, "title":Ljava/lang/CharSequence;
    :goto_0
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetTitleView;->titleView:Landroid/widget/TextView;

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetTitleView;->moreView:Landroid/widget/TextView;

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/WidgetTitleView;->moreView:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    const/16 v4, 0x8

    :goto_1
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 54
    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/Widget;->getTitleUrl()Ljava/lang/String;

    move-result-object v3

    .line 55
    .local v3, "titleUrl":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/Widget;->getMoreUrl()Ljava/lang/String;

    move-result-object v1

    .line 56
    .local v1, "moreUrl":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 57
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetTitleView;->moreView:Landroid/widget/TextView;

    invoke-static {p0, v1}, Lcom/vkontakte/android/ui/widget/WidgetTitleView$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/widget/WidgetTitleView;Ljava/lang/String;)Landroid/view/View$OnClickListener;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    :cond_0
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 60
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetTitleView;->titleView:Landroid/widget/TextView;

    invoke-static {p0, v3}, Lcom/vkontakte/android/ui/widget/WidgetTitleView$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/ui/widget/WidgetTitleView;Ljava/lang/String;)Landroid/view/View$OnClickListener;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 62
    :cond_1
    return-void

    .line 46
    .end local v1    # "moreUrl":Ljava/lang/String;
    .end local v2    # "title":Ljava/lang/CharSequence;
    .end local v3    # "titleUrl":Ljava/lang/String;
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/Widget;->getTitle()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "  /cFF909499"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 47
    invoke-static {}, Ljava/text/NumberFormat;->getInstance()Ljava/text/NumberFormat;

    move-result-object v5

    invoke-virtual {p1}, Lcom/vkontakte/android/api/widget/Widget;->getTitleCounter()Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/text/NumberFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "/e"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 46
    invoke-static {v4}, Lcom/vkontakte/android/TextFormatter;->processString(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v2

    .restart local v2    # "title":Ljava/lang/CharSequence;
    goto :goto_0

    .line 52
    :cond_3
    const/4 v4, 0x0

    goto :goto_1
.end method

.method synthetic lambda$bind$0(Ljava/lang/String;Landroid/view/View;)V
    .locals 1
    .param p1, "moreUrl"    # Ljava/lang/String;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 57
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WidgetTitleView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/vkontakte/android/ui/widget/WidgetTitleView;->openLink(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$bind$1(Ljava/lang/String;Landroid/view/View;)V
    .locals 1
    .param p1, "titleUrl"    # Ljava/lang/String;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 60
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WidgetTitleView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/vkontakte/android/ui/widget/WidgetTitleView;->openLink(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method
