.class public Lcom/vkontakte/android/ui/ListDialog;
.super Ljava/lang/Object;
.source "ListDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;,
        Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;,
        Lcom/vkontakte/android/ui/ListDialog$ListDialogItemHolder;,
        Lcom/vkontakte/android/ui/ListDialog$ListDialogItem;,
        Lcom/vkontakte/android/ui/ListDialog$OnAttachedListener;
    }
.end annotation


# static fields
.field public static final TYPE_COUNT:I = 0x2

.field public static final TYPE_ICON:I = 0x1

.field public static final TYPE_USER:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/view/View;Landroid/app/Dialog;)V
    .locals 0
    .param p0, "x0"    # Landroid/view/View;
    .param p1, "x1"    # Landroid/app/Dialog;

    .prologue
    .line 41
    invoke-static {p0, p1}, Lcom/vkontakte/android/ui/ListDialog;->hideDialog(Landroid/view/View;Landroid/app/Dialog;)V

    return-void
.end method

.method private static hideDialog(Landroid/view/View;Landroid/app/Dialog;)V
    .locals 0
    .param p0, "v"    # Landroid/view/View;
    .param p1, "d"    # Landroid/app/Dialog;

    .prologue
    .line 239
    invoke-static {p1}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 257
    return-void
.end method

.method static synthetic lambda$show$0(Lcom/vkontakte/android/ui/animation/RevealLinearLayout;Landroid/app/Dialog;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2
    .param p0, "rl"    # Lcom/vkontakte/android/ui/animation/RevealLinearLayout;
    .param p1, "dlg"    # Landroid/app/Dialog;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v1, 0x1

    .line 209
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v1, :cond_0

    .line 210
    invoke-static {p0, p1}, Lcom/vkontakte/android/ui/ListDialog;->hideDialog(Landroid/view/View;Landroid/app/Dialog;)V

    .line 212
    :cond_0
    return v1
.end method

.method static synthetic lambda$show$1(Landroid/widget/AdapterView$OnItemClickListener;Lcom/vkontakte/android/ui/animation/RevealLinearLayout;Landroid/app/Dialog;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
    .param p0, "onItemClickListener"    # Landroid/widget/AdapterView$OnItemClickListener;
    .param p1, "rl"    # Lcom/vkontakte/android/ui/animation/RevealLinearLayout;
    .param p2, "dlg"    # Landroid/app/Dialog;
    .param p3, "parent"    # Landroid/widget/AdapterView;
    .param p4, "view1"    # Landroid/view/View;
    .param p5, "position"    # I
    .param p6, "id"    # J

    .prologue
    .line 222
    if-eqz p0, :cond_0

    move-object v0, p0

    move-object v1, p3

    move-object v2, p4

    move v3, p5

    move-wide v4, p6

    .line 223
    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 225
    :cond_0
    invoke-static {p1, p2}, Lcom/vkontakte/android/ui/ListDialog;->hideDialog(Landroid/view/View;Landroid/app/Dialog;)V

    .line 226
    return-void
.end method

.method static synthetic lambda$show$2(Landroid/view/View;Landroid/content/DialogInterface;)V
    .locals 1
    .param p0, "view"    # Landroid/view/View;
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 234
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public static show(Landroid/content/Context;Ljava/util/List;IIILandroid/view/View;Landroid/widget/AdapterView$OnItemClickListener;Lcom/vkontakte/android/ui/ListDialog$OnAttachedListener;)V
    .locals 11
    .param p0, "ctx"    # Landroid/content/Context;
    .param p2, "gravity"    # I
    .param p3, "padding"    # I
    .param p4, "width"    # I
    .param p5, "view"    # Landroid/view/View;
    .param p6, "onItemClickListener"    # Landroid/widget/AdapterView$OnItemClickListener;
    .param p7, "listener"    # Lcom/vkontakte/android/ui/ListDialog$OnAttachedListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/ui/ListDialog$ListDialogItem;",
            ">;III",
            "Landroid/view/View;",
            "Landroid/widget/AdapterView$OnItemClickListener;",
            "Lcom/vkontakte/android/ui/ListDialog$OnAttachedListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 167
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/ui/ListDialog$ListDialogItem;>;"
    new-instance v4, Lcom/vkontakte/android/ui/animation/RevealLinearLayout;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/ui/animation/RevealLinearLayout;-><init>(Landroid/content/Context;)V

    .line 168
    .local v4, "rl":Lcom/vkontakte/android/ui/animation/RevealLinearLayout;
    new-instance v6, Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;

    invoke-direct {v6, p1}, Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;-><init>(Ljava/util/List;)V

    .line 170
    .local v6, "adapter":Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;
    new-instance v1, Lcom/vkontakte/android/ui/ListDialog$1;

    const v3, 0x7f0b0133

    move-object v2, p0

    move-object/from16 v5, p7

    invoke-direct/range {v1 .. v6}, Lcom/vkontakte/android/ui/ListDialog$1;-><init>(Landroid/content/Context;ILcom/vkontakte/android/ui/animation/RevealLinearLayout;Lcom/vkontakte/android/ui/ListDialog$OnAttachedListener;Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;)V

    .line 193
    .local v1, "dlg":Landroid/app/Dialog;
    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v8

    .line 195
    .local v8, "window":Landroid/view/Window;
    invoke-virtual {v8}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v9

    .line 196
    .local v9, "wlp":Landroid/view/WindowManager$LayoutParams;
    iput p2, v9, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 197
    const/high16 v2, 0x40a00000    # 5.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    sub-int v2, p3, v2

    iput v2, v9, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 198
    const/high16 v2, 0x41100000    # 9.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    sub-int v2, p3, v2

    iput v2, v9, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 199
    iput p4, v9, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 200
    const/4 v2, -0x2

    iput v2, v9, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 201
    const v2, 0x3e4ccccd    # 0.2f

    iput v2, v9, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 202
    iget v2, v9, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/lit8 v2, v2, 0x2

    iput v2, v9, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 204
    invoke-virtual {v8, v9}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 205
    const/4 v2, 0x1

    invoke-virtual {v8, v2}, Landroid/view/Window;->requestFeature(I)Z

    .line 206
    invoke-virtual {v8}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Landroid/support/v4/view/ViewCompat;->setElevation(Landroid/view/View;F)V

    .line 207
    invoke-virtual {v8}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    const v3, 0x106000d

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 208
    invoke-virtual {v8}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-static {v4, v1}, Lcom/vkontakte/android/ui/ListDialog$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/animation/RevealLinearLayout;Landroid/app/Dialog;)Landroid/view/View$OnTouchListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 215
    new-instance v7, Landroid/widget/ListView;

    invoke-direct {v7, p0}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 216
    .local v7, "lv":Landroid/widget/ListView;
    const/4 v2, 0x0

    const/high16 v3, 0x41000000    # 8.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    const/4 v5, 0x0

    const/high16 v10, 0x41000000    # 8.0f

    invoke-static {v10}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v10

    invoke-virtual {v7, v2, v3, v5, v10}, Landroid/widget/ListView;->setPadding(IIII)V

    .line 217
    const/4 v2, 0x0

    invoke-virtual {v7, v2}, Landroid/widget/ListView;->setClipToPadding(Z)V

    .line 218
    const v2, 0x7f02013e

    invoke-virtual {v7, v2}, Landroid/widget/ListView;->setSelector(I)V

    .line 219
    const/4 v2, 0x0

    invoke-virtual {v7, v2}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 220
    invoke-virtual {v7, v6}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 221
    move-object/from16 v0, p6

    invoke-static {v0, v4, v1}, Lcom/vkontakte/android/ui/ListDialog$$Lambda$2;->lambdaFactory$(Landroid/widget/AdapterView$OnItemClickListener;Lcom/vkontakte/android/ui/animation/RevealLinearLayout;Landroid/app/Dialog;)Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object v2

    invoke-virtual {v7, v2}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 228
    const v2, 0x7f0202e7

    invoke-virtual {v4, v2}, Lcom/vkontakte/android/ui/animation/RevealLinearLayout;->setBackgroundResource(I)V

    .line 229
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, p4, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v7, v2}, Lcom/vkontakte/android/ui/animation/RevealLinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 230
    move-object/from16 v0, p5

    invoke-static {v4, v0}, Lcom/vkontakte/android/ui/ListDialog;->showDialog(Landroid/view/View;Landroid/view/View;)V

    .line 232
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 233
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, p4, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4, v2}, Landroid/app/Dialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 234
    invoke-static/range {p5 .. p5}, Lcom/vkontakte/android/ui/ListDialog$$Lambda$3;->lambdaFactory$(Landroid/view/View;)Landroid/content/DialogInterface$OnDismissListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 235
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 236
    return-void
.end method

.method public static show(Landroid/content/Context;Ljava/util/List;Landroid/view/View;Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 8
    .param p0, "ctx"    # Landroid/content/Context;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "onItemClickListener"    # Landroid/widget/AdapterView$OnItemClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/ui/ListDialog$ListDialogItem;",
            ">;",
            "Landroid/view/View;",
            "Landroid/widget/AdapterView$OnItemClickListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 161
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/ui/ListDialog$ListDialogItem;>;"
    const v2, 0x800055

    const/high16 v0, 0x41800000    # 16.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    const/high16 v0, 0x438d0000    # 282.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v5, p2

    move-object v6, p3

    invoke-static/range {v0 .. v7}, Lcom/vkontakte/android/ui/ListDialog;->show(Landroid/content/Context;Ljava/util/List;IIILandroid/view/View;Landroid/widget/AdapterView$OnItemClickListener;Lcom/vkontakte/android/ui/ListDialog$OnAttachedListener;)V

    .line 162
    return-void
.end method

.method private static showDialog(Landroid/view/View;Landroid/view/View;)V
    .locals 1
    .param p0, "v"    # Landroid/view/View;
    .param p1, "b"    # Landroid/view/View;

    .prologue
    .line 260
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 273
    return-void
.end method
