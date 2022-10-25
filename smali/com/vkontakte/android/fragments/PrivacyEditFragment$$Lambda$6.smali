.class final synthetic Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$6;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/PrivacyEditFragment;

.field private final arg$2:[Z

.field private final arg$3:[Z

.field private final arg$4:Ljava/util/ArrayList;

.field private final arg$5:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

.field private final arg$6:Landroid/app/AlertDialog;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/PrivacyEditFragment;[Z[ZLjava/util/ArrayList;Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;Landroid/app/AlertDialog;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$6;->arg$1:Lcom/vkontakte/android/fragments/PrivacyEditFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$6;->arg$2:[Z

    iput-object p3, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$6;->arg$3:[Z

    iput-object p4, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$6;->arg$4:Ljava/util/ArrayList;

    iput-object p5, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$6;->arg$5:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    iput-object p6, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$6;->arg$6:Landroid/app/AlertDialog;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/PrivacyEditFragment;[Z[ZLjava/util/ArrayList;Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;Landroid/app/AlertDialog;)Landroid/view/View$OnClickListener;
    .locals 7

    new-instance v0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$6;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$6;-><init>(Lcom/vkontakte/android/fragments/PrivacyEditFragment;[Z[ZLjava/util/ArrayList;Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;Landroid/app/AlertDialog;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$6;->arg$1:Lcom/vkontakte/android/fragments/PrivacyEditFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$6;->arg$2:[Z

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$6;->arg$3:[Z

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$6;->arg$4:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$6;->arg$5:Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$$Lambda$6;->arg$6:Landroid/app/AlertDialog;

    move-object v6, p1

    invoke-virtual/range {v0 .. v6}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->lambda$showListOfCategories$5([Z[ZLjava/util/ArrayList;Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;Landroid/app/AlertDialog;Landroid/view/View;)V

    return-void
.end method
