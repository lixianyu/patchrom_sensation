.class Lcom/android/internal/policy/impl/PhoneWindowManager$3;
.super Ljava/lang/Object;
.source "PhoneWindowManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/PhoneWindowManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/PhoneWindowManager;)V
    .locals 0
    .parameter

    .prologue
    .line 784
    iput-object p1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$3;->this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 787
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$3;->this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iget v1, v1, Lcom/android/internal/policy/impl/PhoneWindowManager;->mLongPressOnPowerBehavior:I

    if-gez v1, :cond_0

    .line 788
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$3;->this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iget-object v2, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$3;->this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iget-object v2, v2, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x10e0012

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    iput v2, v1, Lcom/android/internal/policy/impl/PhoneWindowManager;->mLongPressOnPowerBehavior:I

    .line 791
    :cond_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$3;->this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iget v1, v1, Lcom/android/internal/policy/impl/PhoneWindowManager;->mLongPressOnPowerBehavior:I

    packed-switch v1, :pswitch_data_0

    .line 859
    :cond_1
    :goto_0
    :pswitch_0
    return-void

    .line 802
    :pswitch_1
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$3;->this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iget-boolean v1, v1, Lcom/android/internal/policy/impl/PhoneWindowManager;->mBootCompleted:Z

    if-eqz v1, :cond_1

    .line 803
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$3;->this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iput-boolean v5, v1, Lcom/android/internal/policy/impl/PhoneWindowManager;->mPowerKeyHandled:Z

    .line 804
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$3;->this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iput-boolean v4, v1, Lcom/android/internal/policy/impl/PhoneWindowManager;->mShouldTurnOffOnKeyUp:Z

    .line 805
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$3;->this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v4, v4}, Lcom/android/internal/policy/impl/PhoneWindowManager;->performHapticFeedbackLw(Landroid/view/WindowManagerPolicy$WindowState;IZ)Z

    .line 806
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$3;->this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;

    const-string v2, "globalactions"

    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/PhoneWindowManager;->sendCloseSystemWindows(Ljava/lang/String;)V

    .line 810
    new-instance v0, Ljava/io/File;

    const-string v1, "/data/data/poweroff"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 812
    .local v0, file:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 813
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$3;->this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iget-object v1, v1, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-static {v1, v4}, Lcom/android/internal/app/ShutdownThread;->shutdown(Landroid/content/Context;Z)V

    goto :goto_0

    .line 817
    :cond_2
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$3;->this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iget-boolean v1, v1, Lcom/android/internal/policy/impl/PhoneWindowManager;->mIsGuestMode:Z

    if-nez v1, :cond_3

    .line 818
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$3;->this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/PhoneWindowManager;->showGlobalActionsDialog()V

    goto :goto_0

    .line 821
    :cond_3
    const-string v1, "WindowManager"

    const-string v2, "LONG_PRESS_POWER_GLOBAL_ACTIONS, do not show the GlobalActionsDialog for guest mode"

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 836
    .end local v0           #file:Ljava/io/File;
    :pswitch_2
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$3;->this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iget-boolean v1, v1, Lcom/android/internal/policy/impl/PhoneWindowManager;->mBootCompleted:Z

    if-eqz v1, :cond_1

    .line 837
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$3;->this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iput-boolean v5, v1, Lcom/android/internal/policy/impl/PhoneWindowManager;->mPowerKeyHandled:Z

    .line 838
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$3;->this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iput-boolean v4, v1, Lcom/android/internal/policy/impl/PhoneWindowManager;->mShouldTurnOffOnKeyUp:Z

    .line 839
    new-instance v0, Ljava/io/File;

    const-string v1, "/data/data/poweroff"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 841
    .restart local v0       #file:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 842
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$3;->this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iget-object v1, v1, Lcom/android/internal/policy/impl/PhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-static {v1, v4}, Lcom/android/internal/app/ShutdownThread;->shutdown(Landroid/content/Context;Z)V

    .line 854
    :goto_1
    const-string v1, "WindowManager"

    const-string v2, "[mPowerLongLongPress]--------------->"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 846
    :cond_4
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$3;->this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iget-boolean v1, v1, Lcom/android/internal/policy/impl/PhoneWindowManager;->mIsGuestMode:Z

    if-nez v1, :cond_5

    .line 847
    iget-object v1, p0, Lcom/android/internal/policy/impl/PhoneWindowManager$3;->this$0:Lcom/android/internal/policy/impl/PhoneWindowManager;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/PhoneWindowManager;->showGlobalActionsDialog()V

    goto :goto_1

    .line 850
    :cond_5
    const-string v1, "WindowManager"

    const-string v2, "LONG_PRESS_POWER_SHUT_OFF, do not show the GlobalActionsDialog for guest mode"

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 791
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
