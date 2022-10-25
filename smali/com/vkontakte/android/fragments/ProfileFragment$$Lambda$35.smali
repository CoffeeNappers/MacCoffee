.class final synthetic Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$35;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/ProfileFragment;

.field private final arg$2:Landroid/widget/EditText;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/widget/EditText;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$35;->arg$1:Lcom/vkontakte/android/fragments/ProfileFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$35;->arg$2:Landroid/widget/EditText;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/widget/EditText;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$35;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$35;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/widget/EditText;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$35;->arg$1:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$35;->arg$2:Landroid/widget/EditText;

    invoke-virtual {v0, v1, p1, p2}, Lcom/vkontakte/android/fragments/ProfileFragment;->lambda$showStatusEditDlg$34(Landroid/widget/EditText;Landroid/content/DialogInterface;I)V

    return-void
.end method
