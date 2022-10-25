.class public Lcom/vkontakte/android/ui/widget/WidgetTextView;
.super Lcom/vkontakte/android/ui/widget/WidgetTitleView;
.source "WidgetTextView.java"


# instance fields
.field private final descriptionView:Landroid/widget/TextView;

.field private final textView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 20
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/widget/WidgetTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
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
    .line 24
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/widget/WidgetTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 25
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
    .line 28
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/widget/WidgetTitleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 29
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/WidgetTextView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0301e3

    invoke-static {v1, v2, p0}, Lcom/vkontakte/android/ui/widget/WidgetTextView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 30
    .local v0, "widgetView":Landroid/view/View;
    const v1, 0x7f1001c3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetTextView;->textView:Landroid/widget/TextView;

    .line 31
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetTextView;->textView:Landroid/widget/TextView;

    invoke-static {}, Lcom/vk/attachpicker/util/Fonts;->getRobotoRegular()Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 32
    const v1, 0x7f1001cc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetTextView;->descriptionView:Landroid/widget/TextView;

    .line 33
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetTextView;->descriptionView:Landroid/widget/TextView;

    invoke-static {}, Lcom/vk/attachpicker/util/Fonts;->getRobotoRegular()Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 34
    return-void
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/api/widget/Widget;)V
    .locals 5
    .param p1, "widget"    # Lcom/vkontakte/android/api/widget/Widget;

    .prologue
    const/16 v2, 0x8

    const/4 v3, 0x0

    .line 38
    invoke-super {p0, p1}, Lcom/vkontakte/android/ui/widget/WidgetTitleView;->bind(Lcom/vkontakte/android/api/widget/Widget;)V

    .line 39
    instance-of v1, p1, Lcom/vkontakte/android/api/widget/WidgetText;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 40
    check-cast v0, Lcom/vkontakte/android/api/widget/WidgetText;

    .line 41
    .local v0, "widgetText":Lcom/vkontakte/android/api/widget/WidgetText;
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetTextView;->textView:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/widget/WidgetText;->getText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetTextView;->descriptionView:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/widget/WidgetText;->getDescription()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/WidgetTextView;->textView:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/widget/WidgetText;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    move v1, v2

    :goto_0
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 44
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetTextView;->descriptionView:Landroid/widget/TextView;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/widget/WidgetText;->getDescription()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    :goto_1
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 46
    .end local v0    # "widgetText":Lcom/vkontakte/android/api/widget/WidgetText;
    :cond_0
    return-void

    .restart local v0    # "widgetText":Lcom/vkontakte/android/api/widget/WidgetText;
    :cond_1
    move v1, v3

    .line 43
    goto :goto_0

    :cond_2
    move v2, v3

    .line 44
    goto :goto_1
.end method
