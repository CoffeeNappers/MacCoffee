.class public Lcom/vkontakte/android/ui/holder/UserHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "UserHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/vkontakte/android/UserProfile;",
        ">",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<TT;>;",
        "Landroid/view/View$OnClickListener;",
        "Landroid/widget/CompoundButton$OnCheckedChangeListener;"
    }
.end annotation


# instance fields
.field protected final mActionButton:Landroid/view/View;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected mActionListener:Lcom/vkontakte/android/functions/VoidF1;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field protected final mCheckButton:Landroid/widget/CompoundButton;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected mCheckListener:Lcom/vkontakte/android/functions/VoidF1Bool;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1Bool",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field protected final mConfig:I

.field public final mImage:Lcom/vk/imageloader/view/VKImageView;

.field private mListener:Lcom/vkontakte/android/functions/VoidF1;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field protected final mOnline:Landroid/widget/ImageView;

.field protected final mSubtitle:Landroid/widget/TextView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field protected final mTitle:Landroid/widget/TextView;


# direct methods
.method protected constructor <init>(Landroid/view/ViewGroup;I)V
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "layout"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/ui/holder/UserHolder;, "Lcom/vkontakte/android/ui/holder/UserHolder<TT;>;"
    const/4 v2, 0x0

    .line 116
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p0, p2, v1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 117
    const v1, 0x7f100128

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/UserHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mTitle:Landroid/widget/TextView;

    .line 118
    const v1, 0x7f10019c

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/UserHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mSubtitle:Landroid/widget/TextView;

    .line 119
    const v1, 0x7f1001e8

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/UserHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mImage:Lcom/vk/imageloader/view/VKImageView;

    .line 120
    const v1, 0x7f100066

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/UserHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mOnline:Landroid/widget/ImageView;

    .line 121
    const v1, 0x7f1002b7

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/UserHolder;->$(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mActionButton:Landroid/view/View;

    .line 122
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mActionButton:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 123
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mActionButton:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 125
    :cond_0
    const v1, 0x7f100341

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/UserHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CompoundButton;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mCheckButton:Landroid/widget/CompoundButton;

    .line 126
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mCheckButton:Landroid/widget/CompoundButton;

    if-eqz v1, :cond_1

    .line 127
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mCheckButton:Landroid/widget/CompoundButton;

    invoke-virtual {v1, p0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 129
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 130
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mOnline:Landroid/widget/ImageView;

    if-eqz v1, :cond_3

    .line 131
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mOnline:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v0

    .line 132
    .local v0, "tag":Ljava/lang/Object;
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 133
    check-cast v0, Ljava/lang/String;

    .end local v0    # "tag":Ljava/lang/Object;
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mConfig:I

    .line 140
    :goto_0
    return-void

    .line 135
    .restart local v0    # "tag":Ljava/lang/Object;
    :cond_2
    iput v2, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mConfig:I

    goto :goto_0

    .line 138
    .end local v0    # "tag":Ljava/lang/Object;
    :cond_3
    iput v2, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mConfig:I

    goto :goto_0
.end method

.method protected constructor <init>(Landroid/view/ViewGroup;IZZZ)V
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "layout"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param
    .param p3, "subtitle"    # Z
    .param p4, "check"    # Z
    .param p5, "action"    # Z

    .prologue
    .local p0, "this":Lcom/vkontakte/android/ui/holder/UserHolder;, "Lcom/vkontakte/android/ui/holder/UserHolder<TT;>;"
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 76
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p0, p2, v1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 77
    const v1, 0x7f100128

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/UserHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mTitle:Landroid/widget/TextView;

    .line 78
    const v1, 0x7f1001e8

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/UserHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mImage:Lcom/vk/imageloader/view/VKImageView;

    .line 79
    const v1, 0x7f100066

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/UserHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mOnline:Landroid/widget/ImageView;

    .line 81
    if-eqz p3, :cond_2

    const v1, 0x7f10019c

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/UserHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    :goto_0
    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mSubtitle:Landroid/widget/TextView;

    .line 83
    if-eqz p5, :cond_3

    .line 84
    const v1, 0x7f1002b7

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/UserHolder;->$(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mActionButton:Landroid/view/View;

    .line 85
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mActionButton:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 86
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mActionButton:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 92
    :cond_0
    :goto_1
    if-eqz p4, :cond_4

    .line 93
    const v1, 0x7f100341

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/UserHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CompoundButton;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mCheckButton:Landroid/widget/CompoundButton;

    .line 94
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mCheckButton:Landroid/widget/CompoundButton;

    if-eqz v1, :cond_1

    .line 95
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mCheckButton:Landroid/widget/CompoundButton;

    invoke-virtual {v1, p0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 101
    :cond_1
    :goto_2
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mOnline:Landroid/widget/ImageView;

    if-eqz v1, :cond_6

    .line 103
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mOnline:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v0

    .line 104
    .local v0, "tag":Ljava/lang/Object;
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_5

    .line 105
    check-cast v0, Ljava/lang/String;

    .end local v0    # "tag":Ljava/lang/Object;
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mConfig:I

    .line 112
    :goto_3
    return-void

    :cond_2
    move-object v1, v2

    .line 81
    goto :goto_0

    .line 89
    :cond_3
    iput-object v2, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mActionButton:Landroid/view/View;

    goto :goto_1

    .line 98
    :cond_4
    iput-object v2, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mCheckButton:Landroid/widget/CompoundButton;

    goto :goto_2

    .line 107
    .restart local v0    # "tag":Ljava/lang/Object;
    :cond_5
    iput v3, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mConfig:I

    goto :goto_3

    .line 110
    .end local v0    # "tag":Ljava/lang/Object;
    :cond_6
    iput v3, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mConfig:I

    goto :goto_3
.end method

.method public static actionable(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/UserHolder;
    .locals 1
    .param p0, "parent"    # Landroid/view/ViewGroup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/vkontakte/android/UserProfile;",
            ">(",
            "Landroid/view/ViewGroup;",
            ")",
            "Lcom/vkontakte/android/ui/holder/UserHolder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 39
    const v0, 0x7f030220

    invoke-static {p0, v0}, Lcom/vkontakte/android/ui/holder/UserHolder;->actionable(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    return-object v0
.end method

.method public static actionable(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/UserHolder;
    .locals 6
    .param p0, "parent"    # Landroid/view/ViewGroup;
    .param p1, "layout"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/vkontakte/android/UserProfile;",
            ">(",
            "Landroid/view/ViewGroup;",
            "I)",
            "Lcom/vkontakte/android/ui/holder/UserHolder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 27
    new-instance v0, Lcom/vkontakte/android/ui/holder/UserHolder;

    const/4 v5, 0x1

    move-object v1, p0

    move v2, p1

    move v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/ui/holder/UserHolder;-><init>(Landroid/view/ViewGroup;IZZZ)V

    return-object v0
.end method

.method public static checkable(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/UserHolder;
    .locals 1
    .param p0, "parent"    # Landroid/view/ViewGroup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/vkontakte/android/UserProfile;",
            ">(",
            "Landroid/view/ViewGroup;",
            ")",
            "Lcom/vkontakte/android/ui/holder/UserHolder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 43
    const v0, 0x7f03021d

    invoke-static {p0, v0}, Lcom/vkontakte/android/ui/holder/UserHolder;->checkable(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    return-object v0
.end method

.method public static checkable(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/UserHolder;
    .locals 6
    .param p0, "parent"    # Landroid/view/ViewGroup;
    .param p1, "layout"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/vkontakte/android/UserProfile;",
            ">(",
            "Landroid/view/ViewGroup;",
            "I)",
            "Lcom/vkontakte/android/ui/holder/UserHolder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 31
    new-instance v0, Lcom/vkontakte/android/ui/holder/UserHolder;

    const/4 v4, 0x1

    move-object v1, p0

    move v2, p1

    move v5, v3

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/ui/holder/UserHolder;-><init>(Landroid/view/ViewGroup;IZZZ)V

    return-object v0
.end method

.method public static simple(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/UserHolder;
    .locals 1
    .param p0, "parent"    # Landroid/view/ViewGroup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/vkontakte/android/UserProfile;",
            ">(",
            "Landroid/view/ViewGroup;",
            ")",
            "Lcom/vkontakte/android/ui/holder/UserHolder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 47
    const v0, 0x7f03021b

    invoke-static {p0, v0}, Lcom/vkontakte/android/ui/holder/UserHolder;->simple(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    return-object v0
.end method

.method public static simple(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/UserHolder;
    .locals 6
    .param p0, "parent"    # Landroid/view/ViewGroup;
    .param p1, "layout"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/vkontakte/android/UserProfile;",
            ">(",
            "Landroid/view/ViewGroup;",
            "I)",
            "Lcom/vkontakte/android/ui/holder/UserHolder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 35
    new-instance v0, Lcom/vkontakte/android/ui/holder/UserHolder;

    move-object v1, p0

    move v2, p1

    move v4, v3

    move v5, v3

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/ui/holder/UserHolder;-><init>(Landroid/view/ViewGroup;IZZZ)V

    return-object v0
.end method

.method public static updateOnlineImage(Landroid/widget/ImageView;Lcom/vkontakte/android/UserProfile;I)V
    .locals 4
    .param p0, "imageView"    # Landroid/widget/ImageView;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "user"    # Lcom/vkontakte/android/UserProfile;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "imageDpSize"    # I

    .prologue
    const/4 v3, 0x1

    .line 176
    const v0, 0x77359400

    .line 177
    .local v0, "TWO_E9":I
    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    .line 178
    iget v1, p1, Lcom/vkontakte/android/UserProfile;->online:I

    if-eqz v1, :cond_0

    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    neg-int v2, v0

    if-lt v1, v2, :cond_0

    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    if-lt v1, v0, :cond_2

    .line 179
    :cond_0
    const/16 v1, 0x8

    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 198
    :cond_1
    :goto_0
    return-void

    .line 181
    :cond_2
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 182
    sparse-switch p2, :sswitch_data_0

    goto :goto_0

    .line 184
    :sswitch_0
    iget v1, p1, Lcom/vkontakte/android/UserProfile;->online:I

    if-ne v1, v3, :cond_3

    const v1, 0x7f020229

    :goto_1
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    :cond_3
    const v1, 0x7f02022c

    goto :goto_1

    .line 188
    :sswitch_1
    iget v1, p1, Lcom/vkontakte/android/UserProfile;->online:I

    if-ne v1, v3, :cond_4

    const v1, 0x7f02022a

    :goto_2
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    :cond_4
    const v1, 0x7f02022d

    goto :goto_2

    .line 192
    :sswitch_2
    iget v1, p1, Lcom/vkontakte/android/UserProfile;->online:I

    if-ne v1, v3, :cond_5

    const v1, 0x7f020228

    :goto_3
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    :cond_5
    const v1, 0x7f02022b

    goto :goto_3

    .line 182
    :sswitch_data_0
    .sparse-switch
        0x30 -> :sswitch_0
        0x40 -> :sswitch_1
        0x80 -> :sswitch_2
    .end sparse-switch
.end method


# virtual methods
.method public onAction(Lcom/vkontakte/android/functions/VoidF1;)Lcom/vkontakte/android/ui/holder/UserHolder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)",
            "Lcom/vkontakte/android/ui/holder/UserHolder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 226
    .local p0, "this":Lcom/vkontakte/android/ui/holder/UserHolder;, "Lcom/vkontakte/android/ui/holder/UserHolder<TT;>;"
    .local p1, "listener":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Lcom/vkontakte/android/UserProfile;>;"
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mActionListener:Lcom/vkontakte/android/functions/VoidF1;

    .line 227
    return-object p0
.end method

.method public onBind(Lcom/vkontakte/android/UserProfile;)V
    .locals 5
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/ui/holder/UserHolder;, "Lcom/vkontakte/android/ui/holder/UserHolder<TT;>;"
    .local p1, "user":Lcom/vkontakte/android/UserProfile;, "TT;"
    const/16 v2, 0xa0

    .line 150
    iget-boolean v1, p1, Lcom/vkontakte/android/UserProfile;->verified:Z

    if-eqz v1, :cond_2

    .line 151
    invoke-virtual {p1}, Lcom/vkontakte/android/UserProfile;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/SpannableStringBuilder;

    .line 152
    .local v0, "title":Landroid/text/SpannableStringBuilder;
    if-nez v0, :cond_0

    .line 153
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .end local v0    # "title":Landroid/text/SpannableStringBuilder;
    iget-object v1, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 154
    .restart local v0    # "title":Landroid/text/SpannableStringBuilder;
    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 155
    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 156
    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 157
    new-instance v1, Lcom/vkontakte/android/ui/drawables/CenteredImageSpan;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/UserHolder;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0202ce

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/ui/drawables/CenteredImageSpan;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 159
    :cond_0
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/UserProfile;->setTag(Ljava/lang/Object;)V

    .line 161
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 166
    .end local v0    # "title":Landroid/text/SpannableStringBuilder;
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mOnline:Landroid/widget/ImageView;

    iget v2, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mConfig:I

    invoke-static {v1, p1, v2}, Lcom/vkontakte/android/ui/holder/UserHolder;->updateOnlineImage(Landroid/widget/ImageView;Lcom/vkontakte/android/UserProfile;I)V

    .line 168
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mCheckButton:Landroid/widget/CompoundButton;

    if-eqz v1, :cond_1

    .line 169
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mCheckButton:Landroid/widget/CompoundButton;

    iget-boolean v2, p1, Lcom/vkontakte/android/UserProfile;->isSelected:Z

    invoke-virtual {v1, v2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 172
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mImage:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, p1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 173
    return-void

    .line 163
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mTitle:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .prologue
    .line 24
    .local p0, "this":Lcom/vkontakte/android/ui/holder/UserHolder;, "Lcom/vkontakte/android/ui/holder/UserHolder<TT;>;"
    check-cast p1, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/UserHolder;->onBind(Lcom/vkontakte/android/UserProfile;)V

    return-void
.end method

.method public onCheck(Lcom/vkontakte/android/functions/VoidF1Bool;)Lcom/vkontakte/android/ui/holder/UserHolder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/functions/VoidF1Bool",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)",
            "Lcom/vkontakte/android/ui/holder/UserHolder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 231
    .local p0, "this":Lcom/vkontakte/android/ui/holder/UserHolder;, "Lcom/vkontakte/android/ui/holder/UserHolder<TT;>;"
    .local p1, "listener":Lcom/vkontakte/android/functions/VoidF1Bool;, "Lcom/vkontakte/android/functions/VoidF1Bool<Lcom/vkontakte/android/UserProfile;>;"
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mCheckListener:Lcom/vkontakte/android/functions/VoidF1Bool;

    .line 232
    return-object p0
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 202
    .local p0, "this":Lcom/vkontakte/android/ui/holder/UserHolder;, "Lcom/vkontakte/android/ui/holder/UserHolder<TT;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/UserHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/UserProfile;->isSelected:Z

    if-eq v0, p2, :cond_0

    .line 203
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/UserHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iput-boolean p2, v0, Lcom/vkontakte/android/UserProfile;->isSelected:Z

    .line 204
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mCheckListener:Lcom/vkontakte/android/functions/VoidF1Bool;

    if-eqz v0, :cond_0

    .line 205
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mCheckListener:Lcom/vkontakte/android/functions/VoidF1Bool;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/UserHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Lcom/vkontakte/android/functions/VoidF1Bool;->f(Ljava/lang/Object;Z)V

    .line 208
    :cond_0
    return-void
.end method

.method public onClick(Lcom/vkontakte/android/functions/VoidF1;)Lcom/vkontakte/android/ui/holder/UserHolder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)",
            "Lcom/vkontakte/android/ui/holder/UserHolder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 143
    .local p0, "this":Lcom/vkontakte/android/ui/holder/UserHolder;, "Lcom/vkontakte/android/ui/holder/UserHolder<TT;>;"
    .local p1, "listener":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Lcom/vkontakte/android/UserProfile;>;"
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mListener:Lcom/vkontakte/android/functions/VoidF1;

    .line 144
    return-object p0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 212
    .local p0, "this":Lcom/vkontakte/android/ui/holder/UserHolder;, "Lcom/vkontakte/android/ui/holder/UserHolder<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->itemView:Landroid/view/View;

    if-ne p1, v0, :cond_2

    .line 213
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mCheckButton:Landroid/widget/CompoundButton;

    if-eqz v0, :cond_1

    .line 214
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mCheckButton:Landroid/widget/CompoundButton;

    invoke-virtual {v0}, Landroid/widget/CompoundButton;->toggle()V

    .line 223
    :cond_0
    :goto_0
    return-void

    .line 215
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mListener:Lcom/vkontakte/android/functions/VoidF1;

    if-eqz v0, :cond_0

    .line 216
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mListener:Lcom/vkontakte/android/functions/VoidF1;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/UserHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vkontakte/android/functions/VoidF1;->f(Ljava/lang/Object;)V

    goto :goto_0

    .line 218
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mActionButton:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mActionButton:Landroid/view/View;

    if-ne p1, v0, :cond_0

    .line 219
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mActionListener:Lcom/vkontakte/android/functions/VoidF1;

    if-eqz v0, :cond_0

    .line 220
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/UserHolder;->mActionListener:Lcom/vkontakte/android/functions/VoidF1;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/UserHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vkontakte/android/functions/VoidF1;->f(Ljava/lang/Object;)V

    goto :goto_0
.end method
