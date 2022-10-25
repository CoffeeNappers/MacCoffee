.class final synthetic Lcom/vkontakte/android/CreateGroupDialog$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/ui/CheckableRelativeLayout$OnCheckedChangeListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/CreateGroupDialog;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/CreateGroupDialog;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/CreateGroupDialog$$Lambda$2;->arg$1:Lcom/vkontakte/android/CreateGroupDialog;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/CreateGroupDialog;)Lcom/vkontakte/android/ui/CheckableRelativeLayout$OnCheckedChangeListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/CreateGroupDialog$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/CreateGroupDialog$$Lambda$2;-><init>(Lcom/vkontakte/android/CreateGroupDialog;)V

    return-object v0
.end method


# virtual methods
.method public onCheckedChanged(Landroid/view/View;Z)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/CreateGroupDialog$$Lambda$2;->arg$1:Lcom/vkontakte/android/CreateGroupDialog;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/CreateGroupDialog;->lambda$createView$1(Landroid/view/View;Z)V

    return-void
.end method
