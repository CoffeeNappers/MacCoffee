.class final synthetic Lcom/vkontakte/android/ui/holder/messages/DialogHolder$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/ui/holder/messages/DialogHolder;

.field private final arg$2:Z

.field private final arg$3:Z

.field private final arg$4:Lcom/vkontakte/android/DialogEntry;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/holder/messages/DialogHolder;ZZLcom/vkontakte/android/DialogEntry;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder$$Lambda$1;->arg$1:Lcom/vkontakte/android/ui/holder/messages/DialogHolder;

    iput-boolean p2, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder$$Lambda$1;->arg$2:Z

    iput-boolean p3, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder$$Lambda$1;->arg$3:Z

    iput-object p4, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder$$Lambda$1;->arg$4:Lcom/vkontakte/android/DialogEntry;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/ui/holder/messages/DialogHolder;ZZLcom/vkontakte/android/DialogEntry;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder$$Lambda$1;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/vkontakte/android/ui/holder/messages/DialogHolder$$Lambda$1;-><init>(Lcom/vkontakte/android/ui/holder/messages/DialogHolder;ZZLcom/vkontakte/android/DialogEntry;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder$$Lambda$1;->arg$1:Lcom/vkontakte/android/ui/holder/messages/DialogHolder;

    iget-boolean v1, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder$$Lambda$1;->arg$2:Z

    iget-boolean v2, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder$$Lambda$1;->arg$3:Z

    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder$$Lambda$1;->arg$4:Lcom/vkontakte/android/DialogEntry;

    move-object v4, p1

    move v5, p2

    invoke-virtual/range {v0 .. v5}, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->lambda$onLongClick$0(ZZLcom/vkontakte/android/DialogEntry;Landroid/content/DialogInterface;I)V

    return-void
.end method
