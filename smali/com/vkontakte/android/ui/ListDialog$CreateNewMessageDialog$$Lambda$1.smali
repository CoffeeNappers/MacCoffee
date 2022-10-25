.class final synthetic Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/functions/VoidF1;

.field private final arg$2:Landroid/content/Context;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/functions/VoidF1;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog$$Lambda$1;->arg$1:Lcom/vkontakte/android/functions/VoidF1;

    iput-object p2, p0, Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog$$Lambda$1;->arg$2:Landroid/content/Context;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/functions/VoidF1;Landroid/content/Context;)Landroid/widget/AdapterView$OnItemClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog$$Lambda$1;-><init>(Lcom/vkontakte/android/functions/VoidF1;Landroid/content/Context;)V

    return-object v0
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 8
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v1, p0, Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog$$Lambda$1;->arg$1:Lcom/vkontakte/android/functions/VoidF1;

    iget-object v2, p0, Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog$$Lambda$1;->arg$2:Landroid/content/Context;

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move-wide v6, p4

    invoke-static/range {v1 .. v7}, Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;->lambda$showNewDialogs$0(Lcom/vkontakte/android/functions/VoidF1;Landroid/content/Context;Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method
