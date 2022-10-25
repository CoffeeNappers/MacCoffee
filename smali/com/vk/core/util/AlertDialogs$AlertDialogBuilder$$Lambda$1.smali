.class final synthetic Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:[Ljava/lang/Runnable;


# direct methods
.method private constructor <init>([Ljava/lang/Runnable;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder$$Lambda$1;->arg$1:[Ljava/lang/Runnable;

    return-void
.end method

.method public static lambdaFactory$([Ljava/lang/Runnable;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder$$Lambda$1;-><init>([Ljava/lang/Runnable;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder$$Lambda$1;->arg$1:[Ljava/lang/Runnable;

    invoke-static {v0, p1, p2}, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->lambda$build$0([Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V

    return-void
.end method
