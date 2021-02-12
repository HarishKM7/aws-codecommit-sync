FROM public.ecr.aws/lambda/provided
RUN yum update -y && yum install jq git -y && yum clean all
COPY bootstrap ${LAMBDA_RUNTIME_DIR}
COPY function.sh ${LAMBDA_TASK_ROOT}
CMD [ "function.handler" ]
