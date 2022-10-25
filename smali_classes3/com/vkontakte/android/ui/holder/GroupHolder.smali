.class public Lcom/vkontakte/android/ui/holder/GroupHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GroupHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/Group;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# static fields
.field private static final sFormatter:Ljava/text/DecimalFormat;


# instance fields
.field private mImage:Lcom/vk/imageloader/view/VKImageView;

.field private mInfo:Landroid/widget/TextView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private mListener:Lcom/vkontakte/android/functions/VoidF1;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;"
        }
    .end annotation
.end field

.field private mSubtitle:Landroid/widget/TextView;

.field private mTitle:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 31
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v1}, Ljava/text/NumberFormat;->getInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v1

    check-cast v1, Ljava/text/DecimalFormat;

    sput-object v1, Lcom/vkontakte/android/ui/holder/GroupHolder;->sFormatter:Ljava/text/DecimalFormat;

    .line 32
    sget-object v1, Lcom/vkontakte/android/ui/holder/GroupHolder;->sFormatter:Ljava/text/DecimalFormat;

    invoke-virtual {v1}, Ljava/text/DecimalFormat;->getDecimalFormatSymbols()Ljava/text/DecimalFormatSymbols;

    move-result-object v0

    .line 33
    .local v0, "symbols":Ljava/text/DecimalFormatSymbols;
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/text/DecimalFormatSymbols;->setGroupingSeparator(C)V

    .line 34
    sget-object v1, Lcom/vkontakte/android/ui/holder/GroupHolder;->sFormatter:Ljava/text/DecimalFormat;

    invoke-virtual {v1, v0}, Ljava/text/DecimalFormat;->setDecimalFormatSymbols(Ljava/text/DecimalFormatSymbols;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 49
    const v0, 0x7f0300c8

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 50
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/GroupHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/GroupHolder;->mTitle:Landroid/widget/TextView;

    .line 51
    const v0, 0x7f10019c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/GroupHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/GroupHolder;->mSubtitle:Landroid/widget/TextView;

    .line 52
    const v0, 0x7f1002b1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/GroupHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/GroupHolder;->mInfo:Landroid/widget/TextView;

    .line 53
    const v0, 0x7f1001e8

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/GroupHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/GroupHolder;->mImage:Lcom/vk/imageloader/view/VKImageView;

    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/GroupHolder;->mImage:Lcom/vk/imageloader/view/VKImageView;

    const v1, 0x7f02013d

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(I)V

    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/GroupHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/api/Group;)V
    .locals 10
    .param p1, "group"    # Lcom/vkontakte/android/api/Group;

    .prologue
    const/16 v9, 0xa0

    const/4 v8, 0x0

    .line 66
    iget-object v1, p1, Lcom/vkontakte/android/api/Group;->stringMembersCount:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 67
    const v1, 0x7f0d0021

    iget v2, p1, Lcom/vkontakte/android/api/Group;->members_count:I

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    sget-object v4, Lcom/vkontakte/android/ui/holder/GroupHolder;->sFormatter:Ljava/text/DecimalFormat;

    iget v5, p1, Lcom/vkontakte/android/api/Group;->members_count:I

    int-to-long v6, v5

    invoke-virtual {v4, v6, v7}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v8

    invoke-virtual {p0, v1, v2, v3}, Lcom/vkontakte/android/ui/holder/GroupHolder;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcom/vkontakte/android/api/Group;->stringMembersCount:Ljava/lang/String;

    .line 70
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/GroupHolder;->mImage:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, p1, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 71
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/GroupHolder;->mTitle:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/GroupHolder;->mSubtitle:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/api/Group;->activity:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/GroupHolder;->mInfo:Landroid/widget/TextView;

    if-eqz v1, :cond_1

    .line 74
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/GroupHolder;->mInfo:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/api/Group;->stringMembersCount:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    :cond_1
    iget-boolean v1, p1, Lcom/vkontakte/android/api/Group;->verified:Z

    if-eqz v1, :cond_3

    .line 78
    invoke-virtual {p1}, Lcom/vkontakte/android/api/Group;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/SpannableStringBuilder;

    .line 79
    .local v0, "title":Landroid/text/SpannableStringBuilder;
    if-nez v0, :cond_2

    .line 80
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .end local v0    # "title":Landroid/text/SpannableStringBuilder;
    iget-object v1, p1, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 81
    .restart local v0    # "title":Landroid/text/SpannableStringBuilder;
    invoke-virtual {v0, v9}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 82
    invoke-virtual {v0, v9}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 83
    new-instance v1, Lcom/vkontakte/android/ui/drawables/CenteredImageSpan;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/GroupHolder;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0202ce

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/ui/drawables/CenteredImageSpan;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    invoke-virtual {v0, v1, v2, v3, v8}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 85
    :cond_2
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/api/Group;->setTag(Ljava/lang/Object;)V

    .line 87
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/GroupHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .end local v0    # "title":Landroid/text/SpannableStringBuilder;
    :goto_0
    return-void

    .line 89
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/GroupHolder;->mTitle:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 26
    check-cast p1, Lcom/vkontakte/android/api/Group;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/GroupHolder;->onBind(Lcom/vkontakte/android/api/Group;)V

    return-void
.end method

.method public onClick(Lcom/vkontakte/android/functions/VoidF1;)Lcom/vkontakte/android/ui/holder/GroupHolder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;)",
            "Lcom/vkontakte/android/ui/holder/GroupHolder;"
        }
    .end annotation

    .prologue
    .line 60
    .local p1, "listener":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Lcom/vkontakte/android/api/Group;>;"
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/GroupHolder;->mListener:Lcom/vkontakte/android/functions/VoidF1;

    .line 61
    return-object p0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 95
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/GroupHolder;->mListener:Lcom/vkontakte/android/functions/VoidF1;

    if-eqz v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/GroupHolder;->mListener:Lcom/vkontakte/android/functions/VoidF1;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/GroupHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vkontakte/android/functions/VoidF1;->f(Ljava/lang/Object;)V

    .line 98
    :cond_0
    return-void
.end method
