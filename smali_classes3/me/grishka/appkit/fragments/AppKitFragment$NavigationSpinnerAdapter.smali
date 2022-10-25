.class public Lme/grishka/appkit/fragments/AppKitFragment$NavigationSpinnerAdapter;
.super Landroid/widget/ArrayAdapter;
.source "AppKitFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/grishka/appkit/fragments/AppKitFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "NavigationSpinnerAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lme/grishka/appkit/fragments/AppKitFragment;


# direct methods
.method public constructor <init>(Lme/grishka/appkit/fragments/AppKitFragment;Landroid/content/Context;)V
    .locals 2
    .param p1, "this$0"    # Lme/grishka/appkit/fragments/AppKitFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 375
    iput-object p1, p0, Lme/grishka/appkit/fragments/AppKitFragment$NavigationSpinnerAdapter;->this$0:Lme/grishka/appkit/fragments/AppKitFragment;

    .line 376
    iget v0, p1, Lme/grishka/appkit/fragments/AppKitFragment;->spinnerViewResourceId:I

    const v1, 0x1020014

    invoke-direct {p0, p2, v0, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;II)V

    .line 377
    const v0, 0x1090009

    invoke-virtual {p0, v0}, Lme/grishka/appkit/fragments/AppKitFragment$NavigationSpinnerAdapter;->setDropDownViewResource(I)V

    .line 378
    return-void
.end method


# virtual methods
.method public getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 11
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/high16 v7, -0x1000000

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 382
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 383
    .local v4, "view":Landroid/view/View;
    if-nez p2, :cond_0

    .line 385
    iget-object v5, p0, Lme/grishka/appkit/fragments/AppKitFragment$NavigationSpinnerAdapter;->this$0:Lme/grishka/appkit/fragments/AppKitFragment;

    invoke-virtual {v5}, Lme/grishka/appkit/fragments/AppKitFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    new-array v6, v10, [I

    fill-array-data v6, :array_0

    invoke-virtual {v5, v6}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v3

    .line 386
    .local v3, "ta":Landroid/content/res/TypedArray;
    invoke-virtual {v3, v8, v7}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    .line 387
    .local v0, "colorAccent":I
    invoke-virtual {v3, v9, v7}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    .line 388
    .local v1, "colorForeground":I
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    .line 389
    new-instance v2, Landroid/content/res/ColorStateList;

    new-array v5, v10, [[I

    new-array v6, v9, [I

    const v7, 0x10100a0

    aput v7, v6, v8

    aput-object v6, v5, v8

    new-array v6, v8, [I

    aput-object v6, v5, v9

    new-array v6, v10, [I

    aput v0, v6, v8

    aput v1, v6, v9

    invoke-direct {v2, v5, v6}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .local v2, "csl":Landroid/content/res/ColorStateList;
    move-object v5, v4

    .line 390
    check-cast v5, Landroid/widget/TextView;

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 392
    .end local v0    # "colorAccent":I
    .end local v1    # "colorForeground":I
    .end local v2    # "csl":Landroid/content/res/ColorStateList;
    .end local v3    # "ta":Landroid/content/res/TypedArray;
    :cond_0
    return-object v4

    .line 385
    :array_0
    .array-data 4
        0x7f0100cd
        0x1010030
    .end array-data
.end method
